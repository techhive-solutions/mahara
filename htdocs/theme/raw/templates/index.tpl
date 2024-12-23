{if $pagename == "loggedouthome"}
    {include file="header-landing-page.tpl"}
    <style>
        .loggedouthome {
            background-image: url(https://meetload.com/theme/raw/images/background.webp);
            background-repeat: no-repeat;
            background-size: cover;
        }
        .main-content {
            display: flex;
            flex-direction: column;
            flex-wrap: nowrap;
            justify-content: center;
            align-items: center;
            gap: 2rem;
            margin-top: 1rem;
        }
        @media (min-width: 992px) {
            gap: 6rem;
        }
        .sidebar .card-header {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .sidebar .card-header, .sidebar input, .sidebar a {
            font-weight: bold;
        }
        .card {
            background: rgba( 255, 255, 255, 0.65 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 1.5px );
            -webkit-backdrop-filter: blur( 1.5px );
            border-radius: 10px;
            border: none !important;
        }
    </style>
        <div class="card p-2">
            <p class="mb-0"><span style="font-size:24pt;color:#54b54a;"><span style="color:#000000;">Your</span> e-Portfolio <span style="color:#000000;">Partner!</span></span></p>
        </div>
        <div class="col-12 col-md-6 col-xl-4 sidebar">
            {include file="sidebar.tpl" blocks=$SIDEBLOCKS.right}
        </div>
        <div class="row col-12 col-md-6 col-xl-4">
            <div class="col-12 col-md-4 mb-3">
                <div class="card mb-0 p-2 d-flex flex-row gap-2 align-items-center justify-content-center">
                    <span class="icon icon-refresh" role="presentation" aria-hidden="true"></span>
                    <p class="mb-0 fw-bold fs-6">Reflect</p>
                </div>
            </div>
            <div class="col-12 col-md-4 mb-3">
                <div class="card mb-0 p-2 d-flex flex-row gap-2 align-items-center justify-content-center">
                    <span class="icon icon-plant-wilt" role="presentation" aria-hidden="true"></span>
                    <p class="mb-0 fw-bold fs-6">Grow</p>
                </div>
            </div>
            <div class="col-12 col-md-4 mb-3">
                <div class="card mb-0 p-2 d-flex flex-row gap-2 align-items-center justify-content-center">
                    <span class="icon icon-share" role="presentation" aria-hidden="true"></span>
                    <p class="mb-0 fw-bold fs-6">Share</p>
                </div>
            </div>
        </div>
    </main>
    </body>
    </html>
{else}
    {include file="header.tpl"}
    {$page_content|clean_html|safe}
    {if get_config('homepageinfo') && (!$USER->is_logged_in() || $USER->get_account_preference('showhomeinfo'))}
        {include file="homeinfo.tpl" url=$url}
    {/if}
    {if $dashboardview}
        <div class="dashboard-editable">
            <div class="btn-top-right btn-group btn-group-top" id="editdashboard">
                <button class="btn btn-secondary" data-url="{$WWWROOT}view/blocks.php?id={$viewid}"><span><span class="icon icon-pencil-alt left" role="presentation" aria-hidden="true"> </span> {str tag='editdashboard'}</span></button>
            </div>

            {include file="user/dashboard.tpl"}

        </div>
    {/if}
    {include file="footer.tpl"}
{/if}
{if $saml_logout}
    <script>
    window.top.location.href = '{$WWWROOT}';
    </script>
{/if}
