
package haudq.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class PagingRequestController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url =  "SearchRequestController";
        try {
            String action = request.getParameter("btnAction");
            
//            String name = request.getParameter("name");
//            String rentDate = request.getParameter("rentDate");
//            String status = request.getParameter("status");
            
            HttpSession session =  request.getSession();
            int previous = Integer.parseInt(request.getParameter("offset"));
            int next =  previous + 21;
            if(action.equals("preRequest")){
                if(previous > 0){
                    next = previous;
                    previous -= 21;
                }
            }else{
                previous = next;
                next += 21;
            }
            session.setAttribute("offsetPage", previous);
            session.setAttribute("nextPage", next);
        } catch (Exception e) {
            log("ERROR at PagingController: " + e.getMessage());
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

}
