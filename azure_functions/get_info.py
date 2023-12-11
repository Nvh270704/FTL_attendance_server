import json
import azure.functions as func

def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    try:
        req_body = req.get_json()
    except ValueError:
        return func.HttpResponse(
            "Invalid JSON payload",
            status_code=400
        )

    random_code = req_body.get('random_code')
    student_id = req_body.get('student_id')
    course_id = req_body.get('course_id')

    if not random_code or not student_id or not course_id:
        return func.HttpResponse(
            "Please provide values for 'random_code', 'student_id', and 'course_id'.",
            status_code=400
        )

    # Perform enrollment logic (replace this with your actual business logic)
    # For example, you might store the enrollment information in a database.
    # In this example, we'll just create a simple response.
    response_message = f"Enrollment successful: Random Code = {random_code}, Student ID = {student_id}, Course ID = {course_id}"

    return func.HttpResponse(response_message, status_code=200)
