.PHONY: help install demo run clean test

help:
	@echo "🎬 Video Specifications Tool - Commandes disponibles"
	@echo ""
	@echo "  make install    - Installer les dépendances"
	@echo "  make demo       - Générer des exemples de sortie"
	@echo "  make run        - Lancer l'outil en mode interactif"
	@echo "  make clean      - Nettoyer les fichiers générés"
	@echo "  make test       - Tester l'installation"
	@echo ""

install:
	@echo "📦 Installation des dépendances..."
	uv init
	uv venv
	source .venv/bin/activate
	uv pip install -U click rich rich-click
	@echo "✓ Installation terminée!"

demo:
	@echo "🎬 Génération des exemples..."
	source .venv/bin/activate
	uv run python cli/demo.py
	@echo ""
	@echo "✨ Fichiers générés:"
	@ls -lh demo_output.* 2>/dev/null || echo "Aucun fichier généré"

run:
	@echo "🚀 Lancement de l'outil..."
	source .venv/bin/activate
	uv run cli/video_specs.py

clean:
	@echo "🧹 Nettoyage des fichiers générés..."
	rm -f demo_output.* video_specs_*.* *.pyc
	rm -rf __pycache__
	@echo "✓ Nettoyage terminé!"

test:
	@echo "🔍 Test de l'installation..."
	source .venv/bin/activate
	@uv run python -c "import click; import rich; import rich_click; print('✓ Toutes les dépendances sont installées!')" || echo "❌ Erreur: Exécutez 'make install' d'abord"