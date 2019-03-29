<!DOCTYPE HTML>
<html lang="en" >
<head>
    <title>tell about me</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
    <div>
        <form method="post">
            <input type="text" name="messageAuthor" placeholder="Sign(unnecessary)">
            <input type="text" name="messageText" placeholder="Input your text">
            <button type="submit">Add message</button>
        </form>
    </div>
    <div>
        <form method="post" action="filter">
            <input type="text" name="filterMessageText" placeholder="Filter by text">
            <button type="submit">Search</button>
        </form>
    </div>
    Список сообщений
    <#list messages as message>
        <div>#${message.id}</div>
        <div>${message.author}</div>
        <div>${message.text}</div>
    </#list>
</body>
</html>