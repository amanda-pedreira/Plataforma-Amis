package br.com.amis.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {
    public void init(FilterConfig config) {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String rota = req.getServletPath();

        if (rota.equals("/console")) {
            if (req.getRemoteAddr().equals("127.0.0.1")
            || req.getRemoteAddr().equals("0:0:0:0:0:0:0:1")
            || req.getRemoteAddr().equals("::1")) {
                chain.doFilter(request, response);
            } else {
                resp.sendError(403);
            }
            return;
        }

        Integer adminSessao = (Integer) req.getSession().getAttribute("admin");
        boolean admin = rota.startsWith("/admin/")
        || rota.equals("/admin.jsp")
        || rota.equals("/funcionarios")
        || rota.equals("/alterar-status")
        || rota.equals("/find-all-comentarios")
        || rota.equals("/find-all-amis")
        || rota.equals("/create-amis")
        || rota.equals("/find-all-categorias")
        || rota.equals("/find-all-flags")
        || rota.equals("/create-categoria")
        || rota.equals("/delete-categoria")
        || rota.equals("/create-flag")
        || rota.equals("/delete-flag")
        || rota.equals("/pages/usuario-form.jsp")
        || rota.equals("/pages/usuarios.jsp")
        || rota.equals("/pages/funcionarios.jsp")
        || rota.equals("/pages/categorias.jsp")
        || rota.equals("/pages/flags.jsp")
        || rota.equals("/pages/categoria-form.jsp")
        || rota.equals("/pages/flag-form.jsp")
        || rota.equals("/pages/comentarios.jsp")
        || (rota.equals("/find-all-usuarios") && !"perfil".equals(req.getParameter("pagina")));
        boolean publico = rota.equals("")
        || rota.equals("/")
        || rota.equals("/index.jsp")
        || rota.equals("/inicio")
        || rota.equals("/login")
        || rota.equals("/login.jsp")
        || rota.equals("/pages/login.jsp")
        || rota.equals("/pages/cadastro.jsp")
        || (rota.equals("/create-usuario") && !"perfil".equals(req.getParameter("origem")))
        || rota.equals("/logout")
        || rota.startsWith("/css/")
        || rota.startsWith("/js/")
        || rota.startsWith("/img/")
        || rota.startsWith("/console/")
        || rota.equals("/console");

        if (!publico) {
            if (adminSessao == null) {
                resp.sendRedirect(req.getContextPath() + "/login");
                return;
            }
            if (admin && adminSessao == 0) {
                resp.sendRedirect(req.getContextPath() + "/find-all-postagens");
                return;
            }
            if (admin && adminSessao == 1) {
                br.com.amis.model.Funcionario f = new br.com.amis.dao.FuncionarioDAO().buscar((Integer) req.getSession().getAttribute("idUsuario"));
                if (f == null
                || !"ATIVO".equals(f.getStatus())) {
                    req.getSession().invalidate();
                    resp.sendRedirect(req.getContextPath() + "/login");
                    return;
                }
                String permissao = f.getPermissao();
                req.getSession().setAttribute("permissao", permissao);
                boolean conteudo = rota.contains("categoria")
                || rota.contains("flag")
                || rota.equals("/admin/conteudos");
                boolean moderacao = rota.equals("/find-all-usuarios")
                || rota.equals("/pages/usuarios.jsp")
                || rota.equals("/alterar-status")
                || rota.equals("/admin/postagens");
                if (!rota.equals("/admin.jsp") && !"3".equals(permissao) && !("1".equals(permissao) && conteudo) && !("2".equals(permissao) && moderacao)) {
                    resp.sendError(403);
                    return;
                }
            }
            if (!admin && adminSessao == 1) {
                resp.sendRedirect(req.getContextPath() + "/admin.jsp");
                return;
            }
        }
        if (adminSessao != null && (rota.equals("/login")
        || rota.equals("/login.jsp")
        || rota.equals("/pages/login.jsp")
        || rota.equals("/pages/cadastro.jsp")
        || (rota.equals("/create-usuario") && !"perfil".equals(req.getParameter("origem"))))) {
            if (adminSessao == 1) {
                resp.sendRedirect(req.getContextPath() + "/admin.jsp");
            } else {
                resp.sendRedirect(req.getContextPath() + "/find-all-postagens");
            }
            return;
        }
        chain.doFilter(request, response);
    }
}
