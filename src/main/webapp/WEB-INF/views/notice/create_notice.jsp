<!-- create_notice.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Notice</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/noticeboard.css">
</head>
<body>
<div class="create-notice-container">
    <h2>Create Notice</h2>
    <form action="noticeboard.jsp" method="post">
        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
        </div>
        <div class="form-group">
            <label for="content">Content:</label>
            <textarea id="content" name="content" required></textarea>
        </div>
        <div class="form-group">
            <button type="submit">Submit</button>
        </div>
    </form>
</div>
</body>
</html>