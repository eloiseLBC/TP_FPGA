# 🧠 TP1 – Circuits Programmables
## 🎓 ISEN – AP4 BDX 2024-2025
Sujet : Additionneurs en VHDL sur FPGA Cyclone V GX

## 📁 Structure du projet
Le projet contient plusieurs fichiers VHDL correspondant aux étapes progressives du TP :


### Fichier VHDL	Description
| Fichier              | Description                                                    |
|---------------------:|----------------------------------------------------------------|
| half_adder.vhd       | Demi-additionneur (1 bit) utilisant XOR et AND                 |
| tb_half_adder.vhd    | Testbench pour le demi-additionneur                            |
| full_adder.vhd       | Additionneur complet (1 bit) utilisant deux demi-additionneurs |
| tb_full_adder.vhd    | Testbench pour l’additionneur complet                          |
| full_adder_4b.vhd    | Additionneur complet 4 bits via instanciation de 4 full adders |
| tb_full_adder_4b.vhd | Testbench pour l’additionneur 4 bits                           |
| toplevel.vhd         | Top-level interfaçant le FPGA avec les switches et LEDs        |
| transcodeur_7seg.vhd | Transcodeur 4 bits → 7 segments pour l'affichage HEX           |


## ✅ Objectifs réalisés
* [x] Réalisation d’un demi-additionneur en VHDL
* [x] Simulation du demi-additionneur avec tb_half_adder
* [x] Réalisation d’un additionneur complet (1 bit) par instanciation de deux demi-additionneurs
* [x] Simulation avec tb_full_adder
* [x] Réalisation d’un additionneur complet 4 bits (carry propagé)
* [x] Simulation avec tb_full_adder_4b
* [ ] Interface avec la carte FPGA Cyclone V GX (Switches + LEDs)
* [ ] (Optionnel) Transcodeur pour afficheur HEX
 

## 🧪 Simulation
Les fichiers tb_*.vhd sont des testbenchs manuels qui simulent les entrées des composants et vérifient leur bon comportement à l’aide de assert.

Les tests incluent :
- Toutes les combinaisons de bits pour le demi et full adder 1 bit
- Tests significatifs pour le full adder 4 bits avec propagation de la retenue

## 🧾 Consignes suivies
- Utilisation de Quartus Prime et Questa pour la simulation
- Pas d’utilisation du symbole + dans le code VHDL des additionneurs
- Instanciation manuelle des composants (half_adder, full_adder) pour la version 4 bits
- Capture d’écran de simulation disponible dans le dossier captures/
- Utilisation d’un .gitignore conforme aux recommandations Junia

## 📷 Captures de simulation
Le dossier /captures contient :

- Résultats des simulations avec les signaux d’entrée et de sortie
- Preuves de bon fonctionnement des composants

## 💡 Auteurs
Projet réalisé dans le cadre du TP1 de Circuits Programmables (AP4) – ISEN \
Encadré par : Dr. Antoine Pirog \
Binôme : Renaud Rozenn, Le Blanc Eloïse \
Date de dépôt : [à compléter]
