==============================
REANA Authentication Kerberos5
==============================

.. image:: https://github.com/reanahub/reana-auth-krb5/workflows/CI/badge.svg
      :target: https://github.com/reanahub/reana-auth-krb5/actions

.. image:: https://badges.gitter.im/Join%20Chat.svg
   :target: https://gitter.im/reanahub/reana?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge

.. image:: https://img.shields.io/github/license/reanahub/reana-auth-krb5.svg
   :target: https://github.com/reanahub/reana-auth-krb5/blob/master/LICENSE

About
=====

``reana-auth-krb5`` provides a container image for creating and
renewing Kerberos tokens. The container image includes no additional
logic or libraries, just the bare minimum to support the Kerberos
operations.

``reana-auth-krb5`` was developed for use in the `REANA
<http://www.reana.io/>`_ reusable research data analysis platform.

Usage
=====

The ``reana-auth-krb5`` image is used internally in the REANA platform
to refres the Kerberos token for long running jobs.  The end users can
ask for Kubernetes authentication by means of declaring ``kerberos:
true``, more information `here
<http://docs.reana.io/advanced-usage/access-control/kerberos/>`_.

If you want to try it locally, a Kerberos token can be obtained via::

   $ docker run -i -t --rm reanahub/reana-auth-krb5:1.1.0 /bin/bash
   > kinit -k -t /path/to/keytab_file username@CERN.CH
   > klist

Configuration
=============

Running the ``reana-auth-krb5`` and successfully obtaining a shared
token on a sidecar container requires additional information and
inputs:

- `Kerberos cache
  <https://web.mit.edu/kerberos/krb5-1.12/doc/basic/ccache_def.html>`_
  location to be shared, configured through the ``KRB5CCNAME``
  environment variable
- `Kerberos configuration
  <https://web.mit.edu/kerberos/krb5-1.12/doc/admin/conf_files/krb5_conf.html>`_
  at ``/etc/krb5.conf`` (overridable)

Changes
=======

Version 1.1.0 (2022-12-01)

- Add `krenew` utility to allow renewing of Kerberos tickets for long-running jobs.

Version 1.0.1 (2020-08-12)

- Add CERN Kerberos configuration.

Version 1.0.0 (2020-08-05)

- Initial release

Development
===========

If you would like to contribute to ``reana-auth-krb5`` development,
you can take advantage of the provided ``Makefile``::

   $ make build  # build a new version of the container image
   $ make test   # test the built image
   $ make push   # push it to Docker Hub

More information
================

For more information about `REANA <http://www.reana.io/>`_ reusable research data
analysis platform, please see `its documentation
<http://docs.reana.io/>`_.

Contributors
============

The list of contributors in alphabetical order:

- `Audrius Mecionis <https://orcid.org/0000-0002-3759-1663>`_
- `Diego Rodriguez <https://orcid.org/0000-0003-0649-2002>`_
- `Tibor Simko <https://orcid.org/0000-0001-7202-5803>`_
