<%!
import re
import math
import os
%>

<%def name="paginate(collection, page_size)">\
<%
    page_count = math.ceil(len(collection) / page_size)
    if page_count < 2:
        # chunk, page_count, curpage, page_urls
        return (collection, 1, 1, [SELF_URL])
    page = context.get('_page', 1)
    own_output_path = os.path.join(WEBROOT, SELF_URL.strip('/'))
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
        output_url = re.sub(r'\.html$', r'__page_{}.html'.format(pg), SELF_URL)
        page_urls.append(output_url)
    start_ix = (page - 1) * page_size
    end_ix = page * page_size
    collection_page = collection[start_ix:end_ix]
    # chunk, page_count, curpage, page_urls
    return (collection_page, page_count, page, page_urls)
%>\
</%def>

<%def name="prevnext(page_count, page, page_urls, prev_label='Previous', next_label='Next')">
  <div class="pagination">
    % if page == 1:
      <span class="pagination-item prev">« ${ prev_label }</span>
    % else:
      <a class="pagination-item prev" href="${page_urls[page-2]}">« ${ prev_label }</a>
    % endif
    % if page == page_count:
      <span class="pagination-item next">${ next_label } »</span>
    % else:
      <a class="pagination-item next" href="${page_urls[page]}">${ next_label } »</a>
    % endif
    <br><small class="info">[ Page ${ page } of ${ page_count } ]</small>
  </div>
</%def>
