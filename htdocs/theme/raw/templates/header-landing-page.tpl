<!doctype html>
<!--[if IE 8 ]><html{if $LANGDIRECTION == 'rtl'} dir="rtl"{/if} lang="{$LANGUAGE}" class="ie ie8"><![endif]-->
<!--[if IE 9 ]><html{if $LANGDIRECTION == 'rtl'} dir="rtl"{/if} lang="{$LANGUAGE}" class="ie ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html{if $LANGDIRECTION == 'rtl'} dir="rtl"{/if} lang="{$LANGUAGE}"><!--<![endif]-->
{include file="header/head.tpl"}
<body data-bs-usethemedjs="true" class="no-js {if $ADMIN || $INSTITUTIONALADMIN || $STAFF || $INSTITUTIONALSTAFF || $INSTITUTIONALSUPPORTADMIN}admin{/if} {if $loggedout}loggedout{/if} {if $pagename}{$pagename}{/if} {$presentation|default:'window'}">
    <div class="skiplink btn-group btn-group-top">
        <a class="visually-hidden-focusable btn btn-secondary" {if $headertype=='page'}href="#header-target-main"{else}href="#header-main"{/if}>{str tag=skipmenu}</a>
    </div>

    {if $USERMASQUERADING || !$PRODUCTIONMODE || $SITECLOSED || $SITETOP}
        <div class="site-messages">
    {/if}

    {if $USERMASQUERADING}
        <div class="site-message alert alert-warning" role="alert">
            <div class="container">
                <span>{$masqueradedetails}</span>
                <a href="{$becomeyoulink}">{$becomeyouagain}</a>
            </div>
        </div>
    {/if}
    {if !$PRODUCTIONMODE}
        <div class="site-message alert alert-info" role="alert">
            <div class="container">
                {str tag=notproductionsite section=error}
            </div>
        </div>
    {/if}
    {if $SITEOUTOFSYNC}
        <div class="site-message alert alert-warning" role="alert">
            <div class="container">
                {str tag=siteoutofsyncfor section=error arg1=$SITEOUTOFSYNC}
            </div>
        </div>
    {/if}
    {if $SITECLOSED}
        <div class="site-message alert alert-danger" role="alert">
            <div class="container">
                {if $SITECLOSED == 'logindisabled'}{str tag=siteclosedlogindisabled section=mahara arg1="`$WWWROOT`admin/upgrade.php"}{else}{str tag=siteclosed}{/if}
            </div>
        </div>
    {/if}
    {if $SITETOP}
       <div id="switchwrap">{$SITETOP|safe}</div>
    {/if}

    {if $USERMASQUERADING || !$PRODUCTIONMODE || $SITECLOSED || $SITETOP}
        </div>
    {/if}

    <header class="header fixed-top no-site-messages">
        <div class="navbar navbar-default navbar-main">
            <div class="container">
                <div id="logo-area" class="logo-area">
                    <a href="{$WWWROOT}" class="logo {if $sitelogocustomsmall || (!$sitelogocustomsmall && !$sitelogocustom)}change-to-small{/if}">
                        <img src="{$sitelogo}" alt="{$sitename}" data-bs-customlogo="{$sitelogocustom}" >
                    </a>
                    {if $sitelogocustomsmall}
                        <a href="{$WWWROOT}" class="logoxs">
                            <img src="{$sitelogocustomsmall}" alt="{$sitename}">
                        </a>
                    {/if}
                    {if !$sitelogocustom && !$sitelogocustomsmall}
                        <a href="{$WWWROOT}" class="logoxs change-to-small-default">
                            <img src="{$sitelogosmall}" alt="{$sitename}">
                        </a>
                    {/if}
                    {if $ADMIN || $INSTITUTIONALADMIN || $STAFF || $INSTITUTIONALSTAFF || $INSTITUTIONALSUPPORTADMIN}
                        <div class="admin-title">
                            <a href="{$WWWROOT}admin/" class="admin-site">{str tag="administration"}</a>
                        </div>
                    {/if}
                    <div id="loading-box" class="loading-box d-none"></div>
                </div>

                {include file="header/topright.tpl"}

                <div class="nav-toggle-area">
                    {if $MAINNAV}
                        <button class="main-nav-toggle navbar-toggle collapsed" type="button" data-bs-toggle="collapse" data-bs-target=".nav-main" aria-expanded="false" aria-controls="main-nav" title='{str tag="mainmenu"}'>
                            <span class="visually-hidden">{str tag="showmainmenu"}</span>
                            <span class="icon icon-bars icon-lg" role="presentation" aria-hidden="true"></span>
                        </button>
                    {/if}
                    {if $MAINNAVADMIN}
                        <button class="admin-toggle navbar-toggle collapsed" type="button" data-bs-toggle="collapse" data-bs-target=".nav-main-admin" aria-expanded="false" aria-controls="main-nav-admin" title='{str tag="adminmenu"}'>
                            <span class="visually-hidden">{str tag="showadminmenu"}</span>
                            <span class="icon icon-wrench icon-lg" role="presentation" aria-hidden="true"></span>
                        </button>
                    {/if}
                    {if $LOGGEDIN}
                        <div class="user-icon-wrap-toggle navbar-toggle">
                            <a href="{profile_url($USER)}" class="user-icon user-icon-25" title='{str tag="profilepage"}'>
                                <img src="{profile_icon_url user=$USER maxheight=25 maxwidth=25}" alt="{str tag=profileimagefor section=artefact.internal arg1=display_name($USER->get('id'))}">
                            </a>
                            <button class="user-toggle" type="button" data-bs-toggle="collapse" data-bs-target=".nav-main-user" aria-expanded="false" aria-controls="main-nav-user" title='{str tag="usermenu1"}'>
                                <span class="visually-hidden">{str tag="showusermenu1"}</span>
                                <span class="icon icon-chevron-down collapsed"></span>
                            </button>
                        </div>
                    {/if}
                    {if $MESSAGEBOX}
                        {foreach from=$MESSAGEBOX item=item}
                        <a href="{$WWWROOT}{$item.url}" title="{$item.alt}" role="button" id="nav-{$item.path}" class="navbar-toggle navbar-messages collapsed">
                            <span class="visually-hidden">{$item.title} <span class="{$item.countclasssr}">{$item.unread}</span></span>
                            <span class="icon icon-{$item.iconclass} icon-lg" role="presentation" aria-hidden="true"></span>
                            {if $item.count}
                                <span class="navbar-messages-count">
                                    <span class="{$item.countclass}">{$item.count}</span>
                                </span>
                            {/if}
                        </a>
                        {/foreach}
                    {/if}
                    {if $LANGCHOICES}
                        <button class="lang-toggle navbar-toggle" type="button" data-bs-toggle="collapse" data-bs-target=".nav-language" aria-expanded="false" aria-controls="main-language" title='{str tag="chooselanguage"}'>
                            <span class="visually-hidden">{str tag="chooselanguage"}</span>
                            <span class="icon icon-language icon-lg" role="presentation" aria-hidden="true"></span>
                        </button>
                    {/if}
                    {if !$nosearch && ($LOGGEDIN || $publicsearchallowed)}
                    <button class="search-toggle navbar-toggle collapsed" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-form" aria-expanded="false" aria-controls="usf">
                        <span class="icon icon-search icon-lg" role="presentation" aria-hidden="true"></span>
                        <span class="nav-title visually-hidden">{str tag="showsearch"}</span>
                    </button>
                    {/if}
                </div>
                {if !$nosearch && ($LOGGEDIN || $publicsearchallowed)}
                <div class="navbar-form collapse navbar-collapse{if $languageform} with-langform{if !$LOGGEDIN && !$SHOWLOGINBLOCK && !$LOGINPAGE}-login{/if}{/if}">
                    {header_search_form}
                </div>
                {/if}
                {include file="header/navigation.tpl"}
                {if $LANGCHOICES}
                {include file="header/language.tpl"}
                {/if}
            </div>
        </div>
    </header>

    {if $headertype == "page"}
        {include file="header/pageheader.tpl"}
    {elseif $headertype == "profile"}
        {include file="header/profileheader.tpl"}
    {elseif $headertype == "matrix" || $headertype == "progresscompletion" || $headertype == "outcomeoverview"}
        {include file="header/matrixheader.tpl"}
    {/if}

    <div class="container main-content">
