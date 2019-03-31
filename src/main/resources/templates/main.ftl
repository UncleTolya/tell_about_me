<#import "parts/common.ftl" as c>
<@c.page>
    <div>

        <div class="container">
            <h1 class="display-2 text-center"> _the sign board</h1>
            <#--<p class="lead">or about something else</p>-->
            <hr class="my-2">
        </div>
        <#--<div class="container">-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12 mt-2">
                    <div class="">
                        <button class="btn btn-outline-secondary" style="max-width: 18rem;" type="button"
                                data-toggle="collapse"
                                data-target="#collapseMessageForm" aria-expanded="true"
                                aria-controls="collapseExample">_leave an anonymous sign
                        </button>
                    </div>
                    <#--<div class="input-group" >-->
                    <div class="mt-3 mb-1">
                        <form class="input-group" style="max-width: 16rem;" method="get" action="/main">
                            <input type="text" maxlength="250" class="form-control" name="filterMessageText"
                                   placeholder="_text filter"
                                   aria-label="filter's text" aria-describedby="button-addon2"
                                   value="${filterMessageText!""}">
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="submit" id="button-addon2">_search
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
                    <textarea class="form-control" maxlength="250" name="messageText" id="exampleFormControlTextarea1"
                              rows="3"
                              placeholder="_write any text here. also can add a pic" required></textarea>
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
                        <label class="custom-file-label" for="inputGroupFile01">_choose picture</label>
                    </div>
                </div>
                <p>
                    <button class="btn btn-primary" type="submit">_leave sign on the board</button>
                </p>
            </form>

        </div>
        <#--<div class="row justify-content-end">-->
        <#--<form method="get" action="/main">-->
        <#--<input type="text" name="filterMessageText" placeholder="Filter" value="${filterMessageText!""}">-->
        <#--<button type="submit" class="btn btn-info">Search</button>-->
        <#--</form>-->
        <#--</div>-->
        <div>
            <div class="container">
                <hr class="my-2">
            </div>
            <div class="card-columns">
                <#list messages?reverse as message>

                <div class="card border-secondary m-3" style="max-width: 20rem;">
                    <div class="card-header">#${message.id}, ${message.date}</div>

                    <div class="card-body text-secondary">
                        <#--<h5 class="card-title">Secondary card title</h5>-->
                        <p class="card-text">_${message.text}</p>
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
                _there are no messages. delete filter or use another
            </div>
            </#list>

        </div>
    </div>
</@c.page>
