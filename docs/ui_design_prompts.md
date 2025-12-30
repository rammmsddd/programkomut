# LineLibrary - UI Design Prompts

**App Name:** LineLibrary  
**App Type:** Yazılım Komutları Referans Uygulaması  
**Platforms:** iOS, Android  
**Languages:** Türkçe, İngilizce, Arapça (RTL desteği)

---

## 🎨 GENEL TASARIM YÖNERGELERİ

**Stil:** Modern, minimal, premium  
**Tema:** Dark mode + Light mode desteği  
**Renk paleti:**

- Primary: #6366F1 (Indigo/Mor)
- Accent: #2563EB (Mavi)
- Favorite: Sarı (yıldız ikonu için)
- Dark Background: #0F172A
- Light Background: #FFFFFF

**Font:** Inter veya sistem fontu  
**Köşeler:** Yuvarlak (16-32px radius)  
**Animasyonlar:** Yumuşak geçişler, slide-in efektleri

---

## 📱 EKRAN 1: ANA SAYFA (Home Screen)

### Prompt:

```
Design a premium mobile app home screen for a software command reference app called "LineLibrary".

HEADER SECTION:
- Gradient header (dark purple to indigo) with rounded bottom corners (40px radius)
- App title "LineLibrary" in bold white text (28px)
- Subtitle: "Find commands and shortcuts instantly" in semi-transparent white
- Floating globe icon on the right side with subtle rotation animation

MY COLLECTIONS CARD:
- Horizontal card with purple gradient background
- Left: Bookmark icon in semi-transparent white circle
- Title: "My Collections"
- Subtitle: "3 collections"
- Right arrow icon
- Drop shadow with purple tint

FAVORITES SECTION:
- Section title: "Favorite Programs" (small, uppercase, gray)
- Horizontal scrollable list of program cards
- Each card: 140px wide, contains program icon and name
- Star icon in corner for favorites

ALL PROGRAMS SECTION:
- Section title: "All Programs"
- 2-column grid of program cards
- Each card: Program logo/icon, program name, favorite star
- Cards have subtle shadow and rounded corners (16px)
- Example programs: Photoshop, Excel, Word, AutoCAD, Blender, VS Code, Figma

BOTTOM NAVIGATION:
- Floating bottom bar with rounded corners
- Two tabs: Home (house icon) and Saved (bookmark icon)
- Selected tab has highlighted background
- Glass/blur effect background

Style: Clean, minimal, premium feel. Dark mode version with deep navy background.
```

---

## 📱 EKRAN 2: KOMUT LİSTESİ (Command Listing Screen)

### Prompt:

```
Design a command listing screen for a software reference app.

HEADER:
- Back button (arrow in rounded container)
- Program name as title (e.g., "Photoshop")
- Toggle switch to filter "Shortcuts Only" vs "All Commands"
- Sticky header that stays visible on scroll

SEARCH BAR:
- Large search input with magnifying glass icon
- Placeholder: "Search commands..."
- Rounded corners, subtle border

COMMAND LIST:
- Vertical list of command cards
- Each command card contains:
  - Left: Custom icon representing the command (e.g., copy icon, paste icon)
  - Center:
    - Command name (bold, e.g., "Copy")
    - Keyboard shortcut in pill/badge (e.g., "Ctrl + C")
  - Right: Chevron arrow
- Cards have subtle shadows and hover states
- Alternating subtle background tints for readability

FILTER TABS (when toggled):
- Highlight commands that have shortcuts
- Visual distinction between shortcut and non-shortcut commands

EMPTY STATE:
- Illustration of search
- Message: "No commands found"
- Suggestion to try different keywords

Style: Clean list design, easy to scan, touch-friendly tap targets.
```

---

## 📱 EKRAN 3: KAYITLI KOMUTLAR (Saved Commands Screen)

### Prompt:

```
Design a "My Saved Commands" screen for a software reference app.

HEADER:
- Title: "My Commands" (large, bold)
- Subtitle: "Your personalized command library"
- Settings gear icon button (top right)
- Collections folder icon button (next to settings)

EMPTY STATE (if no saved commands):
- Large bookmark icon with dotted border
- Message: "No saved commands yet"
- Subtitle: "Browse programs and save your favorite commands"
- CTA button: "Browse Programs"

SAVED COMMANDS LIST (when has items):
- Cards grouped by program
- Each card shows:
  - Program icon/initial
  - Command name
  - Shortcut badge
  - Star (filled, yellow) indicating it's saved
- Swipe to delete functionality hint

COLLECTIONS QUICK ACCESS:
- Horizontal row of collection chips/pills
- Each shows collection name and count
- Tappable to filter

Style: Personal, organized, easy to manage saved items.
```

---

## 📱 EKRAN 4: KOMUT DETAY (Command Detail Sheet)

### Prompt:

```
Design a bottom sheet modal for command details.

MODAL DESIGN:
- Slides up from bottom
- Rounded top corners (32px)
- Drag handle at top (small gray bar)
- Takes up 85% of screen height

HEADER ROW:
- Program icon/initial in gradient square
- Command name (large, bold)
- Subtitle: "Photoshop Command"
- X close button (circle)

MAIN CONTENT:
- Large icon representing the command (centered, 72px)
- HUGE shortcut letter display (96px font, blue color, e.g., "C")
- Breadcrumb pill showing menu path: "Edit > Copy" in light blue

DESCRIPTION SECTION:
- Label: "DESCRIPTION" (small, uppercase, gray)
- Full description text (16px, readable line height)

NOTES SECTION:
- Label: "NOTES" (small, uppercase, gray)
- Text input field with placeholder "Add your notes..."
- Pencil/note icon
- User can type personal notes

BOTTOM ACTION BAR:
- Two buttons side by side:
  1. "Add to" - Collections button (gray background)
  2. "Save" / "Saved" - Favorite button
     - Unsaved: Star outline, gray
     - Saved: Filled star, yellow background, yellow border
- Buttons are pill-shaped (28px radius)

Style: Focused detail view, easy to read, clear visual hierarchy.
```

---

## 📱 EKRAN 5: AYARLAR (Settings Modal)

### Prompt:

```
Design a settings bottom sheet modal.

MODAL DESIGN:
- Extra rounded top corners (48px)
- Premium feel with shadows
- Drag handle

HEADER:
- Title: "Settings" (large)
- X close button

DARK MODE TOGGLE:
- Card with icon (sun/moon)
- Label: "Dark Mode" or "Light Mode"
- Custom toggle switch (pill shape with sliding circle)
- Blue when active, gray when inactive

LANGUAGE SECTION:
- Section title: "Language" (small, uppercase)
- List of language options as cards:
  - Flag emoji (🇹🇷, 🇬🇧, 🇸🇦)
  - Language name
  - Checkmark circle when selected
  - Selected language has blue border highlight

CLOSE BUTTON:
- Full-width button at bottom
- Dark background (or blue in dark mode)
- "Close" text, white, bold
- Rounded corners, shadow

Style: Clean settings, easy toggles, clear language selection.
```

---

## 📱 EKRAN 6: KOLEKSİYONLAR (Collections Screen)

### Prompt:

```
Design a collections management screen.

HEADER:
- Back button
- Title: "My Collections"
- Add (+) button to create new collection

COLLECTIONS LIST:
- Vertical list of collection cards
- Each card shows:
  - Folder icon or custom color
  - Collection name (bold)
  - Item count: "12 commands"
  - Chevron arrow
- Cards have subtle shadows

CREATE COLLECTION DIALOG:
- Modal overlay
- Text input for collection name
- Color picker (optional, row of color circles)
- Cancel and Create buttons

EMPTY STATE:
- Folder illustration
- "No collections yet"
- "Create your first collection to organize commands"
- CTA: "Create Collection"

COLLECTION DETAIL:
- When tapped, shows commands in that collection
- Similar to saved commands list
- Ability to remove commands from collection

Style: Organized, folder metaphor, easy management.
```

---

## 📱 EKRAN 7: PROGRAM KARTI (Program Card Component)

### Prompt:

```
Design a program card component used in grids and lists.

CARD DIMENSIONS:
- Grid: ~160x170px (2 columns)
- List: 140x180px (horizontal scroll)

CARD CONTENT:
- Program logo/icon centered (48-64px)
- Program name below (14-16px, bold, 2 lines max)
- Favorite star in top-right corner
  - Outline when not favorite
  - Filled yellow when favorite
  - Tap to toggle

CARD STYLE:
- Background: White (light) / Dark gray (dark)
- Border: 1px subtle gray
- Border radius: 20-24px
- Shadow: Subtle drop shadow
- Hover/tap state: Slight scale up

SELECTED STATE:
- Blue border
- Subtle blue background tint

Example programs to show:
- Adobe Photoshop (Ps icon)
- Microsoft Excel (green spreadsheet icon)
- Blender (orange icon)
- AutoCAD (A icon)
- VS Code (blue brackets icon)
- Figma (purple icon)

Style: App-icon like, consistent sizing, premium feel.
```

---

## 📱 EKRAN 8: BOTTOM NAVIGATION

### Prompt:

```
Design a floating bottom navigation bar.

DIMENSIONS:
- Width: ~90% of screen width
- Height: ~60px
- Positioned 20px from bottom
- Centered horizontally

STYLE:
- Rounded corners (30px)
- Background: White with slight blur (light mode)
- Background: Dark gray with blur (dark mode)
- Subtle shadow
- 1px border

TABS:
- 2 tabs: Home and Saved
- Each tab:
  - Icon (house, bookmark)
  - Label below icon
- Selected tab:
  - Blue/purple background pill
  - White icon and text
- Unselected tab:
  - Gray icon and text

ANIMATION:
- Smooth transition between tabs
- Selected indicator slides

Style: Floating, modern, iOS-like tab bar feel.
```

---

## 🌙 DARK MODE VARIATIONS

Tüm ekranlar için dark mode versiyonu da tasarlanmalı:

- Background: #0F172A (deep navy)
- Card background: #1E293B
- Text: White, 90% opacity
- Secondary text: 60% opacity white
- Borders: #334155
- Keep accent colors similar (blues, purples)

---

## 📐 DESIGN SYSTEM NOTES

**Spacing:**

- Base unit: 8px
- Padding: 16px, 24px, 32px
- Card gaps: 16px

**Typography:**

- Headings: Bold, -0.5 letter spacing
- Body: Regular, 1.5 line height
- Labels: Small, uppercase, letter-spacing 1px

**Shadows:**

- Cards: 0 2px 10px rgba(0,0,0,0.05)
- Buttons: 0 8px 20px with color tint

**Animations:**

- Duration: 300-400ms
- Easing: ease-out
- Slide distance: 20-30%

---

Bu promptları kullanarak her ekran için UI tasarımı oluşturulabilir.
