<%@ page import="org.json.JSONArray, org.json.JSONException" %>
<%@ page contentType="application/json; charset=UTF-8" %>
<%@ page import="org.json.JSONObject" %>

<%
    try {
        // Get the JSON data from the request body
        String requestData = request.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);

        // Parse the JSON data as an array
        JSONArray dataArray = new JSONArray(requestData);

        // Perform validation or processing with the JSON array data
        // Example: Validate each selected answer in the array
        JSONArray incorrectAnswers = new JSONArray();
        for (int i = 0; i < dataArray.length(); i++) {
            String answer = dataArray.getString(i);
            if (!isValidAnswer(answer)) {
                incorrectAnswers.put(answer);
            }
        }

        // Prepare the JSON response
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("invalidAnswers", incorrectAnswers);

        // Send the JSON response back to the client
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    } catch (JSONException e) {
        // Handle JSON parsing errors
        JSONObject errorResponse = new JSONObject();
        errorResponse.put("error", "Invalid JSON format");
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set appropriate HTTP status
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(errorResponse.toString());
    }
%>

<%!
    // Example method to validate an answer (you can replace this with your logic)
    boolean isValidAnswer(String answer) {
        return answer.equals("A") || answer.equals("B") || answer.equals("C") || answer.equals("D");
    }
%>
