# ClipHistory

A lightweight macOS menu bar application that keeps track of your clipboard history. Never lose a copied item again.

## Features

- **Menu Bar Integration** - Quick access from your Mac's menu bar
- **Clipboard Monitoring** - Automatically captures items you copy
- **History Storage** - Persistent storage of clipboard history
- **Simple UI** - Clean, distraction-free interface

## Requirements

- macOS 12.0 or later
- Xcode 14.0 or later (for building from source)

## Installation

### Building from Source

1. Clone the repository:
   ```bash
   git clone https://github.com/ambroseblay/ClipHistory.git
   cd ClipHistory
   ```

2. Open the project in Xcode:
   ```bash
   open ClipHistory.xcodeproj
   ```

3. Build and run:
   - Select the ClipHistory scheme
   - Press `Cmd + R` to build and run

4. The app will launch as a menu bar application

## Usage

1. Launch ClipHistory from your Applications folder
2. Click the clipboard icon in the menu bar to view your clipboard history
3. Your clipboard items are automatically saved and persisted between sessions

## Architecture

The app is built with SwiftUI and consists of:

- **Services** - `ClipboardService` for clipboard monitoring and `HistoryStore` for persistence
- **UI** - Menu bar view and clipboard history display

