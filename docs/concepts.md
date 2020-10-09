# Concepts

## Release-management process versus developement process

From [answer](https://stackoverflow.com/a/6786823) to question *Automatic version number both in setup.py (setuptools) AND source code?*.

> A classic issue when toying with [keyword expansion]() ;)
> 
> The key is to realize that your tag is part of the release management process, not part of the development (and its version control) process.
> 
> In other word, you cannot include a release management data in a development repository, because of the loop you illustrates in your question.
> 
> You need, when generating the package (which is the "release management part"), to write that information in a file that your library will look for and use (if said file exists) for its User-Agent HTTP header.
