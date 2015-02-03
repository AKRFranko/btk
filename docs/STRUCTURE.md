# Project Structure Overview


    bower.json
    composer.json
    config.json (.sample)
    package.json
    Gruntfile.js
    docs/
      *.md 
       research/
            bookmarks.md
            code/
            **/**
    src/
      plugins/
        btk/**.**
      themes/
        btk/**.**
    build/
      plugins/
        btk/**.**
      themes/
        btk/**.**
    test/
      js/**.**
      php/**.**
    dist/
      plugins/
        *.zip
        *.tar.gz
      themes/
        *.zip
        *.tar.gz
    bower_components/
      **/**
    node_modules/
      **/**
    vendor/
      **/**

# docs/
  
Here is where you put markdown documentation of our own project (flat one-level folder style)

# docs/research/

Find interesting reading as your research solutions? Paste them in `research/bookmarks.md`

You build a tiny POC or side project to test out something, share your stuff, dump it in a `research/code/yourresearchthingy` folder
  
# src/

This is where our source code lives src/themes/btk is our _s based theme files and src/plugins/btk is our plugin code. This is where we code stuff, this is the developer's backyard.

# build/

This is where grunt puts compiled/processed stuff it builds as you develop. When code changes are made inside src/ they are to be reflected in /build as wordpress-ready. Stripped of most development cruft.

# dist/

This is where grunt should store tar'ed and zipped version of our theme/plugin w/ all pre-compiled dependencies, stripped of development cruft.
 
# test/

This is where test files are put. More on this eventually.

# bower_components, node_modules, vendor, logs

These are not kept in version control.
