<#import "parts/common.ftl" as c>
<@c.page>
    <div>
        <form method="post">
            <#--<input type="text" name="messageAuthor" placeholder="Sign(unnecessary)">-->
            <input type="text" name="messageText" placeholder="Input your text">
            <button type="submit">Add message</button>
        </form>
    </div>
    <div>
        <form method="post" action="filter">
            <input type="text" name="filterMessageText" value="${filterMessageText!""}">
            <button type="submit">Search</button>
        </form>
    </div>
    Список сообщений
    <#list messages as message>
        <div
        <div>#${message.id}</div>
        <div>${message.date}</div>
        <div>${message.text}</div>
    </#list>
</@c.page>
