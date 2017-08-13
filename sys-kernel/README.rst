Xelnet kernel stack
===================

Context
-------

The default Gentoo stack (notably linux-info.eclass and linux-mod.eclass) make a few
assumptions on the way a user's kernel is managed:

* The kernel sources are installed at ``KERNEL_DIR``, default: ``/usr/src/linux``
* A ``.config`` file is available in ``KBUILD_OUTPUT``, default: ``KERNEL_DIR``
* For out-of-tree modules (e.g nvidia-drivers, virtualbox-modules, etc.), the tree at
  ``KBUILD_OUTPUT`` has already gone through ``make modules_prepare``


Goals
-----

The goal of the Xelnet kernel stack is to work seamlessly within the ``quern``
automated image building system.

This means that:

* The package satisfying ``virtual/linux-source`` should be installed on the compiling
  host
* A secondary, ``DEPEND``-only ebuild should handle preparing ``KBUILD_OUTPUT`` for
  ``linux-info`` and ``linux-mod``-based ebuilds
* Only the in-tree modules and final kernel should be installed to the target system


Implementation
--------------

The stack is split into two ebuilds:

``sys-kernel/xelnet-kbuild``
    This ebuild handles:

    * Writing down the ``.config`` file
    * Preparing the modules
    * Saving the resulting minimal kernel tree to ``/usr/src/kbuild/${KV}``

``sys-kernel/xelnet-image``
    This ebuild handles:

    * Compiling and installing the modules, vmlinux, bzImage
      based on ``/usr/src/kbuild/${KV}``


Beyond these, the ``linux-mod`` and ``linux-info`` eclasses are modified as follow:

* Depend on ``sys-kernel/xelnet-kbuild``
* Look for ``KBUILD_OUTPUT`` as installed


Questions
---------

How many kernels?

    We can install several kernel sources, and take advantage of ``USE=symlink``
    to detect the "target" kernel, as is the default.

    We can also apply that USE flag to the ``xelnet-kbuild``:
    point ``/usr/src/kbuild/linux`` to the actual image


Many kernel flavours?

    This would mean renaming the ebuilds and aligning ``KBUILD_OUTPUT`` to the
    ``KERNEL_DIR`` name, and moving most of the code to a shared eclass.

    Not useful right now.
