# e_shop

Manuel d'utilisation :
- faites un git clone https://github.com/M-Lahmer/flutter_app 
- flutter pub get pour telecharger les dependences. une fois terminé lancer la commande dart run build_runner build
- Pour ceux qui utilisent un émulateur Android, il doivent récupérer l'adresse ip de leur pc  pour l'utiliser dans le methode getUrlPhoto() de la classe PhotoService
getUrlPhoto() {
if (Platform.isAndroid) {
return "http://your_ip_address:8000/photos";
}
if (Platform.isIOS) {
return "http://localhost:8000/photos";
} else {
return "http://localhost:8000/photos";
}
}
- Décompresser le fichier data dans un répertoire de votre choix (path_to_data)
- Ouvrer votre terminal et faire cd path_to_data
- Lancer python3 -m http.server
- Lancer le main de votre projet. Dans le cas échéant(problème d'adresse ip ) vous pouvez tester sur le browser