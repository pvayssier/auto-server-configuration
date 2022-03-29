Automatiser l'installation d'un serveur
=======

Pour lancer votre serveur web vous allez avoir besoin d'au minimum une machine sous Debian(11 de préférence).  
Votre machine devra avoir au moins 4Go de ram et 1 CPU.

> Nous conseillons l'utilisations de machine virtuelles telles que des VPS pour l'installation du serveur.

Ensuite, téléchargez simplement ce dépôt git sur votre machine et lancez les scripts "preset.sh" puis "Setup.sh" avec les commandes suivantes:

```
sudo bash Preset.sh -u <username> -n <"nomdelamachine">

...

sudo bash Setup.sh -m -n -c -e <adressemail> -d <"nomdedomaine">
```

Vous devez donc avoir un accès root ou administrateur sur votre machine pour que le script s'éxecute correctement.

Pour le script "preset.sh" Soyez sûr d'avoir le nom que vous voulez donner à votre machine, le nom du user que vous voulez créer.
Pour le script "Setup.sh" Soyez sûr d'avoir le nom de domaine de votre serveur. Si vous utilisez certbot, il vous faudra une adresse mail pour le certificat, et le nom de domaine.  
Enfin, assurez vous que votre application web écoute sur le port 5000.


Que faire après ?
=======

Une fois la manipulation effectuée vous n'avez plus qu'à importer votre application web sur la machine et la faire tourner puis rendez vous sur votre navigateur et rentrez https://&lt;votrenomdedomaine> pour accéder à votre application.  
> Dans un soucis de sécurité l'outils netdata est installé lors de la configuration, il permet de surveiller l'état de la machine et est accessible sur votre navigateur si vous rentrez http://&lt;votrenomdedomaine>:19999

---

Si vous voulez de plus ample modifications sur votre machine un script pour installer le service fail2ban est disponible, vous pouvez le lancer avec la commande:
```
sudo bash fail2ban.sh
```

Un script de backup est proposé aussi avec la commande:
```
sudo bash Save.sh
```
