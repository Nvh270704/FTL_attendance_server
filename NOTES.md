blazor form take form as input,
submit send http request to the azure function containing:
- course
- timestamp
- studentID
- attandanceCode


front-end
    QRcode:
        attandanceCode
        courseID

    client
        timestamp
        studentID

back-end
    server:
        attandanceCode
        timestamp

    database:
        static_tables:
            courseID
            studentID

        non-static_tables:
            studentID
            timestamp
            correlation(static_tables)


client + QRcode -> azure function



azure queue to store logs


first the students scan the QRcode, if it work they are register as presant in the attendance table.
if the students did not scan the code, after the end of the check in they will be marked absent.