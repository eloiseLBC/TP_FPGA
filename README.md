# 🧠 TP – Circuits Programmables et FPGA
## 🎓 ISEN – AP4 BDX 2024-2025
Sujet : Additionneurs, Composants Séquentiels, Compteurs et MEF en VHDL sur FPGA Cyclone V GX

## 📁 Structure du projet
Le projet contient plusieurs fichiers VHDL correspondant aux étapes progressives des différents TP,
chaque fichier est organisé dans les dossiers nominaux des différents TP:


### TP1 - Fichiers VHDL	Description
| Fichier              | Description                                                    |
|---------------------:|----------------------------------------------------------------|
| half_adder.vhd       | Demi-additionneur (1 bit) utilisant XOR et AND                 |
| tb_half_adder.vhd    | Testbench pour le demi-additionneur                            |
| full_adder.vhd       | Additionneur complet (1 bit) utilisant deux demi-additionneurs |
| tb_full_adder.vhd    | Testbench pour l’additionneur complet                          |
| full_adder_4b.vhd    | Additionneur complet 4 bits via instanciation de 4 full adders |
| tb_full_adder_4b.vhd | Testbench pour l’additionneur 4 bits                           |
| toplevel.vhd         | Top-level interfaçant le FPGA avec les switches et LEDs        |


### TP2 - Fichiers VHDL	Description
| Fichier                         | Description                                                                   |
|--------------------------------:|-------------------------------------------------------------------------------|
| flipflop_JK.vhd                 | Bascule JK synchrone                                                          |
| tb_flipflopJK.vhd               | Testbench pour la bascule JK synchrone                                        |
| flipflop_JKrs.vhd               | Bascule JK asynchrone                                                         |
| tb_flipflop_JKrs.vhd            | Testbench pour la bascule JK asynchrone                                       |
| shift_register_SISO8.vhd        | Registre à décalage série simple (SISO)                                       |
| tb_shift_register_SISO8.vhd     | Testbench pour le registre SISO                                               |
| shift_register_universal.vhd    | Registre universel 4, 8 et 16 bits (décalage, rotation, chargement parallèle) |
| tb_shift_register_universal.vhd | Testbench pour le registre universel                                          |
| toplevel                        | Intégration sur la carte FGPA                                                 |


### TP3 - Fichiers VHDL	Description
| Fichier               | Description                                                      |
|----------------------:|------------------------------------------------------------------|
| clock_divider.vhd     | Diviseur d’horloge paramétrable (fréquence visible à l’œil nu)   |
| tb_clock_divider.vhd  | Testbench pour le diviseur d'horloge                             |
| chenillard.vhd        | Animation séquentielle sur 10 LED                                |
| tb_chenillard.vhd     | Testbench pour le chenillard                                     |
| toplevel.vhd          | Intégration sur la carte FPGA                                    |
| tb_toplevel.vhd       | Testbench pour l'intégration sur carte                           |


### TP4 - Fichiers VHDL	Description
| Fichier                                    | Description                                                      |
|-------------------------------------------:|------------------------------------------------------------------|
| enter_digits_state.vhd                     | Gestion de la saisie du code via boutons                         |
| idle_state / open_state / error_state.vhd  | États d’attente, succès et erreur                                |
| writing_code.vhd                           | Logique d'affichage progressif des caractères saisis             |
| clock_idle / clock_divider.vhd             | Ralentissement de l’horloge pour une visibilité humaine          |
| chenillard.vhd                             | Animation visuelle des LED                                       |
| toplevel.vhd                               | Intégration sur la carte FPGA                                    |


## ✅ Objectifs réalisés
* [x] Développement VHDL de plusieurs dispositifs d'additionneurs
* [x] Simulation des dispositifs
* [x] Interface avec la carte FPGA Cyclone V GX (Switches + LEDs + Keys)
 

## 🧪 Simulation
Les fichiers tb_*.vhd sont des testbenchs manuels qui simulent les entrées des composants et vérifient leur bon comportement à l’aide de assert.

Les tests incluent :
- Toutes les combinaisons de bits possibles pour les différents programmes
- Tests significatifs 

## 🧾 Consignes suivies
- Utilisation de Quartus Prime et Questa pour la simulatio
- Instanciation manuelle des composants
- Capture d’écran de simulation disponible dans le dossier captures/
- Utilisation d’un .gitignore conforme aux recommandations Junia

## 📷 Captures de simulation
Le dossier /captures contient :

- Résultats des simulations avec les signaux d’entrée et de sortie
- Preuves de bon fonctionnement des composants

## 💡 Auteurs
Projet réalisé dans le cadre des cours de TP de Circuits Programmables (AP4) – ISEN \
Encadré par : Dr. Antoine Pirog \
Binôme : Renaud Rozenn, Le Blanc Eloïse \
Date de dépôt : 07 mai 2025
