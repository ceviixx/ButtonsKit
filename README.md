# 🎛️ ButtonsKit

A SwiftUI package that provides a large collection of reusable and customizable `ButtonStyle`s for iOS.  
Ideal for building structured, stylish, and consistent UIs – including Primary, Secondary, Ghost, Gradient, Pills, Chips, and more.

---

## 🚀 Features

- ✅ 15+ modern ButtonStyles
- ✅ Supports `Color`, `Gradient`, `Material`, `AnyShapeStyle`
- ✅ Ghost, Outline, Capsule, Toggle, Segment & Icon Buttons
- ✅ `LoadingButton` with async/await support
- ✅ `ButtonsKitPreviewView` for live preview of all styles
- ✅ Easy to customize and extend

---

## 🎨 Available Styles

| Category         | Styles                                                                 |
|------------------|-------------------------------------------------------------------------|
| Standard          | `PrimaryButtonStyle`, `SecondaryButtonStyle`, `DestructiveButtonStyle`, `DisabledButtonStyle` |
| Custom            | `CustomColorButtonStyle`, `StyledBackgroundButtonStyle`                |
| Gradients         | `LinearGradientButtonStyle`, `RadialGradientButtonStyle`, `AngularGradientButtonStyle` |
| Ghost & Outline   | `GhostButtonStyle`, `CapsuleGhostButtonStyle`, `OutlinedButtonStyle`   |
| Special Buttons   | `PillButtonStyle`, `ToggleButtonStyle`, `SegmentedButtonStyle`         |
| Icon & Label      | `IconButtonStyle`, `LabeledIconButtonStyle`, `ToolbarButtonStyle`      |
| Components        | `LoadingButton`, `ToggleChipButton`                                    |

---

## 📦 Installation

### Swift Package Manager

In Xcode:
1. Go to File > Add Packages
2. Enter the repository URL: https://github.com/ceviixx/ButtonsKit.git
3. Add the HapticsKit library to your target.

---

## 🧪 Preview & Demo

All styles are shown in a live preview:

```swift
ButtonsKitPreviewView()
```

---

## 🛠 Usage Examples

### Primary Button

```swift
Button("Save") {
    // Action
}
.primaryButtonStyle()
```

### Gradient Button

```swift
Button("Get Started") { }
.linearGradientButtonStyle(
    gradient: Gradient(colors: [.blue, .purple])
)
```

### Toggle Chip Button

```swift
@State private var isSelected = true

ToggleChipButton(isSelected: $isSelected) {
    Label("Active", systemImage: "star.fill")
}
```

### Async Loading Button

```swift
@State private var isLoading = false

LoadingButton(isLoading: $isLoading, style: PrimaryButtonStyle()) {
    try await Task.sleep(nanoseconds: 1_000_000_000)
} label: {
    Text("Loading…")
}
```


