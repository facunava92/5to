
De DS30 Bootloader die standaard in de door Knutselaar geleverde 18F25K20 of 18F25K22 zit, werkt op een baudrate van 19K2 bij een Oscillator frequentie van 8Mhz. (Interne oscillator voor de 18F25K20/22)
Voor de 16F877A wordt een oscillator frequentie van 20Mhz gebruikt met extern kristal

Met behulp van de ds30LoaderGui.exe kun je de hex files (te vinden in de Test-files directorie) in de betreffende controller programmeren.
De test files laten 1: simpel een ledje knipperen op pin A5.(D1 voor de 16F877A)
                    2: Knutselaar.eu verschijnen op een 16x2 display (default Proton aangesloten op poort B2 t/m B7)
		    3: Een serieele poort test op 9600 baud


Met behulp van de ds30LoaderConsole.exe kun je vanuit je compiler (b.v. Proton IDE ) rechtstreeks de betreffende PIC programmeren (Zie Knutselaar.eu, DS30 Bootloader, ds30 bootloader als programmer).

In de diverse 16F/18F... bootloader...... directories vindt je de firmware sources van de betreffende PIC's.
Je hebt hier wel MPLAB van Microchip voor nodig (Download: http://www.microchip.com/mplab/mplab-x-ide)

Henk Zeeman	19-Mei-2016
