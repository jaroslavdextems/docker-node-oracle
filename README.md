# docker-node-oracle

This image is based on trusted image of Ubuntu and includes

Now available 12.1 and 12.2 (latest) versions of orcale instant client.

You can just add package.json with

```json
...
    "dependencies": {
        "oracledb": "^2.3.0"
    }
...
```

or install it directly with ```bash npm i oracledb --save```

Also you can check template of Node.js and Oracle DB project at https://github.com/jaroslavdextems/oracle-nodejs-template

Work on alpine based Image is in progress...

Thanks to https://github.com/CollinEstes/docker-node-oracle for ideas off Oracle instant client installation
