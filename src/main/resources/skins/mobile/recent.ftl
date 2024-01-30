<#--

    Rhythm - A modern community (forum/BBS/SNS/blog) platform written in Java.
    Modified version from Symphony, Thanks Symphony :)
    Copyright (C) 2012-present, b3log.org

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->
<#include "macro-head.ftl">
<#include "macro-list.ftl">
<#include "common/sub-nav.ftl">
<#include "common/index-nav.ftl">
<#include "macro-pagination.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${latestLabel} - ${symphonyLabel}">
        <meta name="description" content="${symDescriptionLabel}"/>
        </@head>
    </head>
    <body>
        <div class="mobile-head">
            <#include "header.ftl">
            <@indexNav "recent"/>

        </div>
        <div style="height: 74px;width: 1px;" ></div>
        <div class="recent__nav">
            <a pjax-title="${latestLabel} - ${symphonyLabel}" href="${servePath}/recent" class="recent__nav-item  <#if '' == current>recent__nav-check</#if>">默认</a>
            <a pjax-title="${latestLabel} - ${symphonyLabel}" href="${servePath}/recent/hot" class="recent__nav-item  <#if '/hot' == current>recent__nav-check</#if>">热议</a>
            <a pjax-title="${goodCmtsLabel} - ${symphonyLabel}"href="${servePath}/recent/good"class="recent__nav-item  <#if '/good' == current>recent__nav-check</#if>">好评</a>
            <a pjax-title="${recentCommentLabel} - ${symphonyLabel}" href="${servePath}/recent/reply"class="recent__nav-item  <#if '/reply' == current>recent__nav-check</#if>">最近回帖</a>
            <a pjax-title="${perfectLabel} - ${symphonyLabel}" href="${servePath}/perfect" class="recent__nav-item  <#if '/perfect' == current>recent__nav-check</#if>">优选</a>
        </div>

        <div class="main">
            <div class="content fn-clear">
                <@list listData=stickArticles/>
                <@list listData=latestArticles/>
                <@pagination url="${servePath}/recent"/>
                <#if domains?size != 0>
                <div class="wrapper">
                    <div class="module">
                        <div class="module-header">
                            <h2>${domainNavLabel}</h2>
                            <a href="${servePath}/domains" class="ft-gray fn-right">All Domains</a>
                        </div>
                        <div class="module-panel">
                            <ul class="module-list domain">
                                <#list domains as domain>
                                <#if domain.domainTags?size gt 0>
                                <li>
                                    <a rel="nofollow" class="slogan" href="${servePath}/domain/${domain.domainURI}">${domain.domainTitle}</a>
                                    <div class="title">
                                        <#list domain.domainTags as tag>
                                        <a class="tag" rel="nofollow" href="${servePath}/tag/${tag.tagURI}">${tag.tagTitle}</a>
                                        </#list>
                                    </div>
                                </li>
                                </#if>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div>
                </#if>
            </div>
            <div class="side wrapper">
                <#include "side.ftl">
            </div>
        </div>
        <#include "footer.ftl">
        <@listScript/>
    </body>
</html>
