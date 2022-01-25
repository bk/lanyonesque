<%!
import re
import math
import os
%>

<%def name="paginate(collection, page_size=None)">\
<%doc>
Takes a collection of pages/posts and paginates it by page_size.  The current
subset of pages/posts is returned along with the page count, the current page
and a list of urls for the newly written pages with the other chunks. (The
calling page template is used for getting the output for each chunk which is
then written to a file named basename + '__page_NUM.html').

Normal usage pattern in the calling page:

    <% posts_page, page_count, page, page_urls = paginate(all_posts) %>
    <div class="posts">${ posts_list(posts_page) }</div>
    ${ prevnext(page_count, page, page_urls) }
</%doc>\
<%
    if page_size is None:
        page_size = context.get('site.paginate', 5)
    page_count = math.ceil(len(collection) / page_size)
    if page_count < 2:
        # chunk, page_count, curpage, page_urls
        return (collection, 1, 1, [SELF_URL])
    page = context.get('_page', 1)
    _self_url = SELF_URL
    if _self_url.endswith('/'):
        _self_url += 'index.html'
    own_output_path = os.path.join(WEBROOT, _self_url.strip('/'))
    page_urls = [SELF_URL]
    if page == 1 and page_count > 1:
        for pg in range(2, page_count+1):
            page_template = context.lookup.get_template(SELF_TEMPLATE)
            output_fn = re.sub(r'\.html$', r'__page_{}.html'.format(pg), own_output_path)
            kw = dict(**context.kwargs)
            kw['_page'] = pg
            with open(output_fn, 'w') as fpg:
                fpg.write(page_template.render(**kw))
    for pg in range(2, page_count+1):
        output_url = re.sub(r'\.html$', r'__page_{}.html'.format(pg), _self_url)
        page_urls.append(output_url)
    start_ix = (page - 1) * page_size
    end_ix = page * page_size
    collection_page = collection[start_ix:end_ix]
    # chunk, page_count, curpage, page_urls
    return (collection_page, page_count, page, page_urls)
%>\
</%def>

<%def name="prevnext(page_count, page, page_urls, prev_label='Previous', next_label='Next', force=False)">
<%
if page_count <= 1 and not force:
    return ''
%>
  <div class="pagination">
    % if page == 1:
      <span class="pagination-item prev">« ${ prev_label }</span>
    % else:
      <a class="pagination-item prev" href="${ site.leading_path or '' }${ page_urls[page-2] }">« ${ prev_label }</a>
    % endif
    % if page == page_count:
      <span class="pagination-item next">${ next_label } »</span>
    % else:
      <a class="pagination-item next" href="${ site.leading_path or '' }${ page_urls[page] }">${ next_label } »</a>
    % endif
    <br><small class="info">[ Page ${ page } of ${ page_count } ]</small>
  </div>
</%def>
