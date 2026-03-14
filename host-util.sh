    1)
        loading "Downloading supporting files"
        # Stap 1: Alleen de basis server tools installeren
        sudo apt update && sudo apt install -y avahi-daemon python3 screen wget

        # Stap 2: Checken of Google Chrome al op het systeem staat
        if ! command -v google-chrome &> /dev/null
        then
            echo -e "${YELLOW}WAARSCHUWING: Google Chrome is niet gevonden!${NC}"
            echo -e "Download Chrome eerst handmatig of via deze link:"
            echo -e "${CYAN}https://www.google.com{NC}"
            echo -e "Installeer het .deb bestand en run dit script daarna opnieuw."
            read -p "Druk op Enter om toch door te gaan met de server-setup..."
        fi

        loading "Starting App Store Server"
        # Stap 3: Hostnaam en Server setup
        sudo hostnamectl set-hostname dpzxtek
        if [ ! -f index.html ]; then
            echo "<h1>DPZXTEK APP STORE</h1><p>Server is actief!</p>" > index.html
        fi
        
        # Start server op de achtergrond
        sudo screen -d -m python3 -m http.server 80
        
        echo -e "${GREEN}Server is live op http://dpzxtek.local${NC}"
        
        # Probeer Chrome te openen (als het geïnstalleerd is)
        if command -v google-chrome &> /dev/null; then
            google-chrome --no-sandbox http://dpzxtek.local &
        fi
        ;;
