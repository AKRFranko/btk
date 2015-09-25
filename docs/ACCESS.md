| Users: | franko@badb0x | pom2ter@badb0x | git@badb0x | root@badb0x |
|-------------------------|-----------------|--------------------|--------------------|-------------|
| Github-cli Credentials: | franko's | pom2ter | git@akr | n/a |
| Linode-cli Credentials: | franko's | pom2ter via franko | client credentials | n/a |
| Sudo Access Local | yes | yes | no | duh |
| Root Access Dev | only via badb0x | only via badb0x | specific commands | no |
| Root Access Prod | only via badb0x | only via badb0x | specific commands | no |


Therefore: 

- Only franko and pom2ter can ssh on badb0x
- git user represents client entity
- only sudo users can tell the git user what to do
- The git user cannot sudo and it's not allowed to do things out of it's scope
- Only users from badb0x can ssh the client's servers.
- Human users on badbox dont need to know client's credentials.
- Each human user can manage their own github/linodes from there also

