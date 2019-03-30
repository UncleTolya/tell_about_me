<#import "parts/common.ftl" as c>
<@c.page>
    <div>
        <form method="post" enctype="multipart/form-data">
            <input type="text" name="messageText" placeholder="Input your text">
            <input type="file" name="messagePicture">
            <p></p><button type="submit">Add message</button></p>
        </form>
    </div>

    Список сообщений
    <div>
        <form method="get" action="/main">
            <input type="text" name="filterMessageText" placeholder="Фильтр" value="${filterMessageText!""}">
            <button type="submit">Search</button>
        </form>
    </div>
    <#list messages as message>
        <div
        <div>#${message.id}</div>
        <div>${message.date}</div>
        <div>${message.text}</div>
        <div>
            <#if message.filePicture??>
                <img src="/img/${message.filePicture}">
            </#if>
        </div>
    </#list>
</@c.page>
