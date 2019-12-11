import Beans.Dot;
import Beans.DotBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet (name = "AreaCheckServlet", urlPatterns = "/WEB-INF/areaCheckServlet")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] x = req.getParameterValues("checkbox[]");
        double y = Double.parseDouble(req.getParameter("y"));
        double r = Double.parseDouble(req.getParameter("r"));
        DotBean bean = (DotBean) getServletContext().getAttribute("array");
        List<Dot> list = new ArrayList<>();

        for (String value : x){
            if (!ControllerServlet.isNaN(value)){
                bean.addValue(Double.parseDouble(value),y,r,zoneCheck(Double.parseDouble(value),y,r));
                list.add(new Dot(Double.parseDouble(value),y,r,zoneCheck(Double.parseDouble(value),y,r)));
            }
        }
        if (req.getHeader("X-Requested-With")!= null){
            resp.getWriter().write(Dot.toJsonArray(list.toArray(new Dot[0])));
        }else {
            resp.sendRedirect("index.jsp");
        }
    }
    boolean zoneCheck(double x, double y, double r) {
        if ((y >= -r && y <= 0)&&(x >= r/2 && x<= 0)) {
            return true;
        }else
        if ((x >= y + r ) && (x >= -r/2) && (x <= 0)){
            return true;
        }else
            return (Math.pow(x, 2) + Math.pow(x, 2) <= r) && x >= 0 && y >= 0;
    }
}