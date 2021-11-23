<%!
import re
import markdown
%>
<%namespace file="/lib/dates.mc" import="date_format" />

<%def name="posts_list(posts, detail=None)">
<%
if detail is None:
    detail = site_posts_list_detail or 'full'  # title, summary, full
%>
  % for post in posts:
    <div class="post">
      <h1 class="post-title">
        <a href="${ site_leading_path or '' }${ post['url'] }">
          ${ post['data']['title'] }
        </a>
      </h1>
      <span class="post-date">${ date_format(post['data'].get('pubdate', post['data']['MTIME'])) }</span>
      % if detail == 'title':
        ## Don't show any more of the post in this case
        <% pass %>
      % elif detail == 'summary':
        ${ summary(post) }
        <p class="read-more"><a href="${ site_leading_path or '' }${ post['url'] }">Read more »</a></p>
      % else:
        ## Full post text
        ${ post['rendered'] }
      % endif
  </div>
  % endfor
</%def>

<%def name="summary(post)">
<%
if 'summary' in post['data']:
    s = post['data']['summary']
else:
    # Create summary out of first paragraph of Markdown source
    s = post['doc']
    # preserve non-inlined links if applicable
    linkdefs = ''
    found = re.findall(r'^\[\w+\]:\s+\S+', s, re.MULTILINE)
    if found:
        linkdefs = '\n'.join(found)
    s = re.sub(r'^\s+#+[^\n]+\s+', '', s)  # remove leading headings
    s = re.sub(r'^\s+', '', s)
    s = re.sub(r'\n\n[\s\S]*', '', s)
    if linkdefs:
        s += "\n\n" + linkdefs + "\n"
%>
${ markdown.markdown(s, extensions=['extra']) }
</%def>
