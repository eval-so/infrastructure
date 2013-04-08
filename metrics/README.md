# Rebuilding the Metrics box(es)

* Run the playbook with `--extra-args='target=the.host.name'`
* ssh to the box, cd to `/lib/python2.7/site-packages/graphite`, run `python manage.py syncdb`
