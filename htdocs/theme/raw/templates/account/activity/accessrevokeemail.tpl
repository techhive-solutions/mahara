<p>{str tag=emailheader section=notification.email arg1=$sitename}</p>
------------------------------------------------------------------------
<p>
{str section='collection' tag='userhasremovedaccess' arg1=$fullname arg2=$viewtitle|safe}
</p>
{if $message}
<p>
{str section='collection' tag='userrevokereason'}
{strip}
{$message}
{/strip}
</p>
{/if}
------------------------------------------------------------------------
<p>{str tag=emailfooter section=notification.email arg1=$sitename, arg2=$prefurl|clean_html|safe}</p>