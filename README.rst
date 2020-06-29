===========================
REANA Environment Kerberos5
===========================

About
=====

``reana-auth-krb5`` provides a container image with encapsulated runtime
execution environment for creating and renewing Kerberos tokens. The container image
includes no additional logic or libraries, just the bare minimum to support the Kerberos operations.

``reana-auth-krb5`` was developed for use in the `REANA <http://reana.readthedocs.io/>`_ reusable research data analysis platform.

Usage
=====

The ``reana-auth-krb5`` image is used internally in the REANA platform to refres the Kerberos token for long running jobs.
The end users can ask for Kubernetes authentication by means of declaring ``kerberos: true``, more information `here <http://docs.reana.io/advanced-usage/access-control/kerberos/>`_.

If you want to try it locally, a Kerberos token can be obtained via:

```shell
$ docker run -i -t --rm reanahub/reana-auth-krb5 /bin/bash
> kinit -kt /path/to/keytab_file username@server.org
> klist
```

Configuration
=============

Running the ``reana-auth-krb5`` and successfully obtaining a shared token on a sidecar container requires additional information and inputs:

- The `Kerberos cache <https://web.mit.edu/kerberos/krb5-1.12/doc/basic/ccache_def.html>`_ location to be shared, configured through the ``KRB5CCNAME`` environment variable
- `Kerberos configuration <https://web.mit.edu/kerberos/krb5-1.12/doc/admin/conf_files/krb5_conf.html>`_ at ``/etc/krb5.conf`` (overridable)

Development
===========

If you would like to contribute to ``reana-auth-krb5`` development, you can
take advantage of the provided ``Makefile``::

   $ make build  # build a new version of the container image
   $ make test   # test the built image
   $ make push   # push it to Docker Hub


More information
================

For more information about `REANA <http://www.reanahub.io/>`_ reusable research data
analysis platform, please see `its documentation
<http://docs.reana.io/>`_.

Contributors
============

The list of contributors in alphabetical order:

- `Diego Rodriguez <https://orcid.org/0000-0003-0649-2002>`_
- `Tibor Simko <https://orcid.org/0000-0001-7202-5803>`_
