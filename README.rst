Vimrc
=====

My vim profile settings.

Installation
-------------

::

    git clone git://github.com/gabriellima/dotvim.git ~/.vim

Create symlinks
-------------

::

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Download submodules
-------------------

::

    cd ~/.vim
    git submodule init
    git submodule update

External dependencies
---------------------

1. nose::

    sudo apt-get install python-nose

    OR

    sudo pip install nose
