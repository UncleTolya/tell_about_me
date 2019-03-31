<#import "parts/common.ftl" as c>
<@c.page>
    <div>

        <div class="container">
            <h1 class="display-2">the sign board</h1>
            <#--<p class="lead">or about something else</p>-->
            <hr class="my-2">
        </div>
        <#--<div class="container">-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="">
                        <button class="btn btn-outline-secondary" style="max-width: 18rem;" type="button" data-toggle="collapse"
                                data-target="#collapseMessageForm" aria-expanded="true"
                                aria-controls="collapseExample">leave an anonymous sign
                        </button>
                    </div>
                    <#--<div class="input-group" >-->
                    <div class="mt-3">
                        <form class="input-group" style="max-width: 18rem;" method="get" action="/main">
                            <input type="text" class="form-control" name="filterMessageText" placeholder="filter"
                                   aria-label="filter's text" aria-describedby="button-addon2"
                                   value="${filterMessageText!""}">
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="submit" id="button-addon2">search
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <#--</div>-->
            </div>
        </div>
        <#--</div>-->
        <div class="collapse m-3" style="max-width: 65rem;" id="collapseMessageForm">
            <form method="post" action="/main" enctype="multipart/form-data">
                <#--<input type="text" name="messageText" placeholder="Write any text. You can add a pic.">-->
                <p>
                <div class="form-group">
                    <#--<label for="exampleFormControlTextarea1">Example textarea</label>-->
                    <textarea class="form-control" name="messageText" id="exampleFormControlTextarea1" rows="3"
                              placeholder="write any text here. also can add a pic"></textarea>
                </div>
                <#--<input type="file" name="messagePicture">-->
                <p>
                <div class="input-group mb-3">
                    <#--<div class="input-group-prepend">-->
                    <#--<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>-->
                    <#--</div>-->
                    <div class="custom-file">
                        <input type="file" name="messagePicture" class="custom-file-input" id="inputGroupFile01"
                               aria-describedby="inputGroupFileAddon01">
                        <label class="custom-file-label" for="inputGroupFile01">choose picture</label>
                    </div>
                </div>
                <p>
                    <button class="btn btn-primary" type="submit">add message on the board</button>
                </p>
            </form>
        </div>
        <#--<div class="row justify-content-end">-->
        <#--<form method="get" action="/main">-->
        <#--<input type="text" name="filterMessageText" placeholder="Filter" value="${filterMessageText!""}">-->
        <#--<button type="submit" class="btn btn-info">Search</button>-->
        <#--</form>-->
        <#--</div>-->
        <div class="card-columns">
            <#list messages?reverse as message>

            <div class="card border-secondary m-3" style="max-width: 18rem;">
                <div class="card-header">#${message.id}, ${message.date}</div>
                <div class="card-body text-secondary">
                    <#--<h5 class="card-title">Secondary card title</h5>-->
                    <p class="card-text">${message.text}</p>
                </div>
                <#if message.filePicture??>
                    <img src="/img/${message.filePicture}" class="card-img-top" alt="img_${message.id}">
                </#if>
            </div>

            <#else>
        </div>
    <#--<div class="jumbotron jumbotron-fluid">-->
    <#--<div class="container">-->
    <#--<h1 class="display-4">there are no messages</h1>-->
    <#--<p class="lead">delete filter or use another</p>-->
    <#--</div>-->
    <#--</div>-->
        <div class="alert alert-info m-3" role="alert">
            there are no messages. delete filter or use another
        </div>
        </#list>
    </div>
</@c.page>
