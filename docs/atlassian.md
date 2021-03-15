# Atlassian

## Jira

### Bookmarklet

I wrote the following Javascript (bookmarklet) for collapsing/opening all sprints in the backlog:

```javascript
document
  .querySelectorAll('div.ghx-backlog-header.js-sprint-header > button')
  .forEach(element =>
  {
    element.click();
  });
  void(null);
```

It loops over all relevant buttons and clicks them. This means that an open sprint list is closed, and vice versa.

To use it drag the following link to your browser's bookmarks menu: <a href="javascript: document.querySelectorAll('div.ghx-backlog-header.js-sprint-header > button').forEach(element => { element.click(); }); void(null);">Collapse sprints</a> .

### Text formatting notation

* [Text Formatting Notation Help](https://jira.atlassian.com/secure/WikiRendererHelpAction.jspa?section=all)

### Filters

* [ ] Show issues that has me as a reporter.

### Statistics

* [ ] Personal burndown, etc.


## Confluence

* [x] Map drive to confluence

  - [Instructions from Atlassian](https://confluence.atlassian.com/doc/configuring-a-webdav-client-for-confluence-148044.html#ConfiguringaWebDAVclientforConfluence-windowsnetworkdrive)
  - To map to the root of the ICT confluence site, use `\\<serverlocation>@SSL\webdav` as folder when mapping to the drive.
