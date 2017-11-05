# Nginx Config Generator
Virtualmin hook to set Nginx config when creating/editing/deleting a virtualserver.

## Requirements
It only work with virtualservers created after installed a version of webmin-virtual-server >= 6.01.gpl-3.

## Install instructions
As root run:
```
cp virtualmin-nginx-hook /usr/local/bin/virtualmin-nginx-hook
mkdir /usr/local/etc/nginx-templates
cp -r nginx-templates /usr/local/etc/nginx-templates/
```

Verify that `NGINX_SITES_AVAILABLE_DIRECTORY` and `NGINX_SITES_ENABLED_DIRECTORY` directories exists.

Now login to virtualmin with a user with root privileges and:

1. Go to System Settings -> Virtualmin Configuration.
2. Select the Actions upon server and user creation category.
3. In the Command to run after making changes to a server field, enter `/usr/local/bin/virtualmin-nginx-hook`.
4. Click Save.

## Specify custom nginx template
You can specify a custom nginx template for a virtualserver.

You only have to set the description of the virtualserver using this pattern:
```
[nginx-template custom-template-name]
```

With previous example (if default script config is not modified), the following files must exists:
```
/usr/local/etc/nginx-templates/custom-template-name/plantilla-nginx-ssl.conf
/usr/local/etc/nginx-templates/custom-template-name/plantilla-nginx.conf
```

If custom template is not found, default template will be used instead.
