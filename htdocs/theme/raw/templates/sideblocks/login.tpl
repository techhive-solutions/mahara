<div class="card">
    <h2 class="card-header">
        <span class="float-end">{contextualhelp plugintype='core' pluginname='core' section='loginbox'}</span>
    </h2>
    <div class="card-body">
        <noscript><p>{str tag="javascriptnotenabled"}</p></noscript>
        {dynamic}{$messages.loginbox|safe}{/dynamic}
        <div id="loginform_container">{$sbdata.loginform|safe}</div>
    </div>
</div>
