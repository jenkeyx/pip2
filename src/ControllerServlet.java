import Beans.DotBean;
import Beans.ErrorBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "ControllerServlet", urlPatterns = "controllerServlet")
public class ControllerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("WEB-INF/areaCheckServlet").forward(request, response);
        execBeans(request);
        if (!hasAnyParams(request)) {
            if (hasRequiredParams(request)) {
                if (hasCorrectParams(request)) {
                } else {
                    ErrorBean errorBean = (ErrorBean) request.getAttribute("errors");
                    searchErrors(request, errorBean);
                    request.getRequestDispatcher("WEB-INF/error.jsp");
                }
            } else {
                ErrorBean errorBean = (ErrorBean) request.getAttribute("errors");
                searchErrors(request, errorBean);
                request.getRequestDispatcher("WEB-INF/error.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    private boolean hasAnyParams(HttpServletRequest request) {
        return request.getParameterMap().isEmpty();
    }

    private boolean hasRequiredParams(HttpServletRequest request) {
        Map<String, String[]> paramsMap = request.getParameterMap();
        return paramsMap.containsKey("checkbox[]") && paramsMap.containsKey("y") && paramsMap.containsKey("r");
    }

    private boolean hasCorrectParams(HttpServletRequest request) {
        return isCheckboxCorrect(request) && isTextAreaCorrect(request);
    }

    private boolean hasParam(HttpServletRequest request, String paramName) {
        return (request.getParameter(paramName) != null);
    }

    private boolean isCheckboxCorrect(HttpServletRequest request) {
        boolean result = false;
        String[] xArr = request.getParameterValues("checkbox[]");
        for (String xStr : xArr) {
            if (isNaN(xStr)) {
                double x = Double.parseDouble(xStr);
                if (x > -2 && x < 2) {
                    result = true;
                }
            }
        }
        return result;
    }

    private boolean isTextAreaCorrect(HttpServletRequest request) {
        boolean resultY = false;
        boolean resultR = false;
        String yStr = request.getParameter("y");
        String rStr = request.getParameter("r");
        if (isNaN(yStr)) {
            double y = Double.parseDouble(yStr);
            if (y >= -3 && y <= 5) {
                resultY = true;
            }
        }
        if (isNaN(rStr)) {
            double r = Double.parseDouble(rStr);
            if (r >= 2 && r <= 5) {
                resultR = true;
            }
        }
        return resultY && resultR;
    }

    static boolean isNaN(String x) {
        return Double.isNaN(Double.parseDouble(x));
    }

    private void execBeans(HttpServletRequest request) {
        if (getServletContext().getAttribute("array") == null) {
            DotBean array = new DotBean();
            getServletContext().setAttribute("array", array);
        }
        if (request.getAttribute("errors") == null) {
            ErrorBean errors = new ErrorBean();
            request.setAttribute("errors", errors);
        }
    }

    private void searchErrors(HttpServletRequest request, ErrorBean errorBean) {
        if (hasParam(request, "checkbox[]")) {
            ((ErrorBean) request.getAttribute("errors")).addError("Параметр X задан некорректно");
        } else {
            ((ErrorBean) request.getAttribute("errors")).addError("Параметр X не задан");
        }

        if (hasParam(request, "y")) {
            ((ErrorBean) request.getAttribute("errors")).addError("Параметр Y задан некорректно");
        } else {
            ((ErrorBean) request.getAttribute("errors")).addError("Параметр Y не задан");
        }

        if (hasParam(request, "r")) {
            ((ErrorBean) request.getAttribute("errors")).addError("Параметр R задан некорректно");
        } else {
            ((ErrorBean) request.getAttribute("errors")).addError("Параметр R не задан");
        }

    }

}
