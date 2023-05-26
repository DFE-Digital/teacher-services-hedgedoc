# Teacher services hedgedoc

> [Hedgedoc](https://hedgedoc.org/) (formerly known as CodiMD *or hackmd*) is an open-source, web-based, self-hosted, collaborative markdown editor. You can use it to easily collaborate on notes, graphs and even presentations in real-time. All you need to do is to share your note-link to your co-workers and they’re ready to go.

This repository deploys the DfE Teacher services hedgedoc server for use by anyone in DfE. Make sure you read the limitations below.

## Limitations
- Any DfE user can create content, there is no governance and there is no monitoring. **Never include confidential information.**
- This is well adapted for quick note taking and collaboration and there is no guarantee the content will be available forever. Use Sharepoint, Confluence or Github for **long term storage**.

## Deployment
### Development
There is a development environment with the webapp on AKS, Azure storage account and a postgres databse AKS container. Data will ne persisted.

- URL: https://hedgedoc.test.teacherservices.cloud/
- Request access to the test subscription via PIM (self approved)
- Deploy with `make development terraform-apply`

[Github authentication](https://docs.hedgedoc.org/guides/auth/github/) is achieved via OAuth app `Teacher Services Hedgedoc Development`

### Production
There is a production environment with the webapp on AKS, Azure storage account and Azure flexible server for postgres.

- URL: https://hedgedoc.teacherservices.cloud/
- Request access to the production subscription via PIM (approved by a manager)
- Deploy with `make production terraform-apply`

[Github authentication](https://docs.hedgedoc.org/guides/auth/github/) is achieved via OAuth app `Teacher Services Hedgedoc Production`
