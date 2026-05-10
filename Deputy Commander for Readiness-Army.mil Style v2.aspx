<!DOCTYPE html>
<!-- saved from url=(0102)file:///C:/Users/kenneatta.jasper/OneDrive%20-%20militaryhealth/GLWACH/SharePoint/canvas%20Banner.html -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Deputy Commander for Readiness – Army.mil Style v2</title>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      background: #d0d0d0;
    }

    /* ══════════════════════════════════════════
       OUTER WRAPPER
    ══════════════════════════════════════════ */
    .banner-wrap {
      width: 100%;
      display: flex;
      flex-direction: column;
      box-shadow: 0 6px 32px rgba(0,0,0,0.45);
    }

    /* ── 1. Top Gold Accent Bar ── */
    .top-accent {
      height: 6px;
      background: #f0c940;
      width: 100%;
    }

    /* ── 2. Command Header ── */
    .cmd-header {
      background: #1b2a1b;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 8px 28px;
      border-bottom: 3px solid #3a5a3a;
    }

    .cmd-header-left {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .cmd-logo {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 36px;
      height: 36px;
    }

    .cmd-header-text {
      display: flex;
      flex-direction: column;
    }

    .cmd-header-text .cht-top {
      font-size: 0.52rem;
      color: #f0c940;
      letter-spacing: 0.22em;
      text-transform: uppercase;
      font-weight: 700;
    }

    .cmd-header-text .cht-main {
      font-size: 0.72rem;
      color: #ffffff;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      font-weight: 800;
    }

    .cmd-header-right {
      display: flex;
      align-items: center;
      gap: 20px;
    }

    .cmd-tag {
      text-align: center;
    }

    .cmd-tag .ct-label {
      font-size: 0.48rem;
      color: #7a9a7a;
      letter-spacing: 0.16em;
      text-transform: uppercase;
    }

    .cmd-tag .ct-val {
      font-size: 0.68rem;
      color: #f0c940;
      font-weight: 800;
      letter-spacing: 0.08em;
      text-transform: uppercase;
    }

    .cmd-divider {
      width: 1px;
      height: 30px;
      background: #3a5a3a;
    }

    /* ── 3. Hero Strip ── */
    .hero-strip {
      background: linear-gradient(135deg, #0d1f0d 0%, #1b3a1b 40%, #162b16 70%, #0d1f0d 100%);
      display: flex;
      align-items: stretch;
      position: relative;
      overflow: hidden;
      min-height: 200px;
    }

    /* Diagonal overlay */
    .hero-strip::after {
      content: '';
      position: absolute;
      top: 0; right: 0;
      width: 45%;
      height: 100%;
      background: linear-gradient(135deg, transparent 0%, rgba(240,201,64,0.04) 100%);
      pointer-events: none;
    }

    /* Watermark text */
    .hero-strip::before {
      content: 'ARMY';
      position: absolute;
      right: 20px;
      bottom: -10px;
      font-size: 140px;
      font-weight: 900;
      color: rgba(255,255,255,0.025);
      letter-spacing: 0.1em;
      line-height: 1;
      pointer-events: none;
      user-select: none;
    }

    /* Left gold border stripe */
    .hero-border-left {
      width: 6px;
      background: linear-gradient(180deg, #f0c940 0%, #c9a227 50%, #f0c940 100%);
      flex-shrink: 0;
    }

    /* Seal / icon area */
    .hero-icon-area {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 28px 20px;
      gap: 10px;
      flex-shrink: 0;
      min-width: 130px;
    }

    .hero-icon-ring {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      border: 2px solid #f0c940;
      background: radial-gradient(circle at 40% 35%, #1b3a1b, #0d1f0d);
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 0 0 5px rgba(240,201,64,0.12), 0 4px 20px rgba(0,0,0,0.5);
    }

    .hero-icon-ring svg { width: 54px; height: 54px; }

    .hero-icon-label {
      font-size: 0.48rem;
      color: #7aaa7a;
      letter-spacing: 0.2em;
      text-transform: uppercase;
      font-weight: 700;
      text-align: center;
    }

    /* Center content */
    .hero-main {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding: 28px 24px;
      border-left: 1px solid rgba(255,255,255,0.06);
      position: relative;
      z-index: 1;
    }

    .hero-tag {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      margin-bottom: 10px;
    }

    .hero-tag-line {
      width: 30px;
      height: 2px;
      background: #f0c940;
    }

    .hero-tag-text {
      font-size: 0.58rem;
      color: #f0c940;
      letter-spacing: 0.28em;
      text-transform: uppercase;
      font-weight: 700;
    }

    .hero-heading {
      font-size: clamp(1.6rem, 3.5vw, 2.8rem);
      font-weight: 900;
      color: #ffffff;
      text-transform: uppercase;
      letter-spacing: 0.04em;
      line-height: 1.0;
      margin-bottom: 8px;
    }

    .hero-heading em {
      font-style: normal;
      color: #f0c940;
    }

    .hero-division {
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 12px;
    }

    .hero-division-rule {
      flex: 1;
      max-width: 50px;
      height: 2px;
      background: #8b0000;
    }

    .hero-division-text {
      font-size: 0.62rem;
      color: #aaaaaa;
      text-transform: uppercase;
      letter-spacing: 0.2em;
    }

    .hero-mission-txt {
      font-size: clamp(0.64rem, 1vw, 0.78rem);
      color: #99bb99;
      font-style: italic;
      line-height: 1.65;
      max-width: 520px;
    }

    /* Right panel */
    .hero-right-panel {
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding: 20px 24px;
      gap: 0;
      border-left: 1px solid rgba(240,201,64,0.12);
      flex-shrink: 0;
      min-width: 170px;
      position: relative;
      z-index: 1;
    }

    .hrp-item {
      padding: 10px 0;
      border-bottom: 1px solid rgba(255,255,255,0.07);
    }

    .hrp-item:last-child { border-bottom: none; }

    .hrp-label {
      font-size: 0.48rem;
      color: #7a9a7a;
      letter-spacing: 0.18em;
      text-transform: uppercase;
      font-weight: 700;
    }

    .hrp-value {
      font-size: 0.78rem;
      color: #f0c940;
      font-weight: 800;
      letter-spacing: 0.06em;
      text-transform: uppercase;
      margin-top: 2px;
    }

    /* Right border stripe */
    .hero-border-right {
      width: 6px;
      background: linear-gradient(180deg, #f0c940 0%, #c9a227 50%, #f0c940 100%);
      flex-shrink: 0;
    }

    /* ── 4. Olive/Tan Section Tabs ── */
    .section-tabs {
      background: #2e3d2e;
      display: flex;
      flex-wrap: wrap;
      border-bottom: 3px solid #f0c940;
    }

    .tab-group {
      display: flex;
      flex-direction: column;
      padding: 10px 18px;
      border-right: 1px solid rgba(255,255,255,0.07);
      flex: 1;
      min-width: 130px;
    }

    .tab-group:last-child { border-right: none; }

    /* Public Health double-wide group */
    .tab-group.ph-wide {
      flex: 2;
      min-width: 280px;
      align-items: center;
    }

    .tab-group-hdr {
      font-size: 0.52rem;
      color: #f0c940;
      letter-spacing: 0.2em;
      text-transform: uppercase;
      font-weight: 800;
      padding-bottom: 5px;
      border-bottom: 1px solid rgba(240,201,64,0.25);
      margin-bottom: 6px;
      width: 100%;
      text-align: left;
    }

    /* Center label in ph-wide */
    .tab-group.ph-wide .tab-group-hdr {
      text-align: center;
    }

    .tab-links {
      display: flex;
      flex-direction: column;
      gap: 3px;
    }

    /* Two-column grid for Public Health items */
    .tab-links-double {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 3px 18px;
      width: 100%;
    }

    .tab-link {
      font-size: 0.6rem;
      color: #c8d8c8;
      letter-spacing: 0.05em;
      text-transform: uppercase;
      font-weight: 600;
      display: flex;
      align-items: center;
      gap: 6px;
    }

    .tab-link::before {
      content: '';
      width: 5px;
      height: 5px;
      background: #f0c940;
      border-radius: 1px;
      transform: rotate(45deg);
      flex-shrink: 0;
    }

    /* ── 5. Priorities Section ── */
    .priorities-section {
      background: #111a11;
      padding: 0;
    }

    .priorities-hdr {
      background: #1b2a1b;
      text-align: center;
      padding: 7px 0;
      font-size: 0.58rem;
      letter-spacing: 0.3em;
      color: #7aaa7a;
      text-transform: uppercase;
      font-weight: 800;
      border-bottom: 1px solid #2e3d2e;
    }

    .priorities-grid {
      display: flex;
      flex-wrap: wrap;
    }

    .p-card {
      flex: 1;
      min-width: 140px;
      display: flex;
      align-items: flex-start;
      gap: 10px;
      padding: 12px 14px;
      border-right: 1px solid #1b2a1b;
      border-bottom: 1px solid #1b2a1b;
      transition: background 0.2s;
    }

    .p-card:last-child { border-right: none; }

    .p-card:hover { background: rgba(240,201,64,0.04); }

    /* Alert card for Health Protection */
    .p-card.alert {
      background: rgba(139,0,0,0.15);
      border-left: 4px solid #8b0000;
    }

    .p-circle {
      width: 28px;
      height: 28px;
      border-radius: 50%;
      background: #2e3d2e;
      border: 2px solid #f0c940;
      color: #f0c940;
      font-size: 0.72rem;
      font-weight: 900;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
    }

    .p-card.alert .p-circle {
      background: #8b0000;
      border-color: #f0c940;
      color: #f0c940;
    }

    .p-body {}

    .p-title {
      font-size: 0.62rem;
      color: #e8e8e8;
      font-weight: 800;
      text-transform: uppercase;
      letter-spacing: 0.05em;
      line-height: 1.3;
    }

    .p-sub {
      display: inline-block;
      margin-top: 4px;
      font-size: 0.48rem;
      color: #111a11;
      background: #f0c940;
      border-radius: 2px;
      padding: 1px 5px;
      font-weight: 800;
      letter-spacing: 0.1em;
      text-transform: uppercase;
    }

    .p-card.alert .p-sub {
      background: #f0c940;
      color: #1a1a1a;
    }

    /* ── 6. Bottom Motto Bar ── */
    .motto-bar {
      background: linear-gradient(90deg, #1b2a1b 0%, #2e3d2e 30%, #2e3d2e 70%, #1b2a1b 100%);
      border-top: 3px solid #f0c940;
      border-bottom: 3px solid #f0c940;
      text-align: center;
      padding: 8px 20px;
      font-size: 0.68rem;
      font-weight: 900;
      letter-spacing: 0.32em;
      color: #ffffff;
      text-transform: uppercase;
    }

    .motto-bar span { color: #f0c940; margin: 0 10px; }

    /* ── 7. Footer ── */
    .banner-footer {
      background: #0d1f0d;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 6px 28px;
      border-top: 1px solid #1b2a1b;
    }

    .bf-left, .bf-right {
      font-size: 0.52rem;
      color: #4a6a4a;
      letter-spacing: 0.14em;
      text-transform: uppercase;
    }

    .bf-center {
      display: flex;
      align-items: center;
      gap: 6px;
    }

    .bf-dot {
      width: 6px;
      height: 6px;
      border-radius: 50%;
      background: #f0c940;
    }

    /* ══════════════════════════════════════════
       RESPONSIVE
    ══════════════════════════════════════════ */
    @media (max-width: 768px) {
      .hero-strip { flex-direction: column; }
      .hero-border-left, .hero-border-right { width: 100%; height: 5px; background: linear-gradient(90deg, #f0c940, #c9a227, #f0c940); }
      .hero-icon-area { padding: 18px; }
      .hero-main { padding: 14px 18px; border-left: none; border-top: 1px solid rgba(255,255,255,0.06); }
      .hero-right-panel { border-left: none; border-top: 1px solid rgba(240,201,64,0.12); flex-direction: row; flex-wrap: wrap; gap: 10px; justify-content: center; padding: 12px; }
      .hrp-item { border-bottom: none; border-right: 1px solid rgba(255,255,255,0.07); padding: 0 12px; }
      .hrp-item:last-child { border-right: none; }
      .tab-group { border-right: none; border-bottom: 1px solid rgba(255,255,255,0.07); width: 100%; }
      .tab-group.ph-wide { flex: unset; min-width: unset; align-items: flex-start; }
      .tab-group.ph-wide .tab-group-hdr { text-align: left; }
      .tab-links-double { grid-template-columns: 1fr; }
      .p-card { border-right: none; }
      .banner-footer { flex-direction: column; gap: 4px; text-align: center; }
      .cmd-header { flex-direction: column; text-align: center; }
      .cmd-header-right { flex-direction: column; gap: 8px; }
      .cmd-divider { width: 30px; height: 1px; }
    }
  </style>
</head>
<body>

<div class="banner-wrap">

  <!-- 1. Gold Top Accent -->
  <div class="top-accent"></div>

  <!-- 2. Command Header -->
  <div class="cmd-header">
    <div class="cmd-header-left">
      <div class="cmd-logo">
        <svg viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg" width="36" height="36">
          <polygon points="18,2 21.5,11.5 32,11.5 23.5,17.5 26.5,27 18,21.5 9.5,27 12.5,17.5 4,11.5 14.5,11.5" fill="#f0c940" stroke="#c9a227" stroke-width="0.8"></polygon>
        </svg>
      </div>
      <div class="cmd-header-text">
        <div class="cht-top">U.S. Army &nbsp;|&nbsp; General Leonard Wood Community Hospital</div>
        <div class="cht-main">Deputy Commander for Readiness &nbsp;·&nbsp; DCR</div>
      </div>
    </div>
    <div class="cmd-header-right">
      <div class="cmd-tag">
        <div class="ct-label">Installation</div>
        <div class="ct-val">Fort Leonard Wood, MO</div>
      </div>
      <div class="cmd-divider"></div>
      <div class="cmd-tag">
        <div class="ct-label">Command</div>
        <div class="ct-val">MRC-West</div>
      </div>
      <div class="cmd-divider"></div>
      <div class="cmd-tag">
        <div class="ct-label">Hospital</div>
        <div class="ct-val">GLWCH</div>
      </div>
    </div>
  </div>

  <!-- 3. Hero Strip -->
  <div class="hero-strip">
    <div class="hero-border-left"></div>

    <div class="hero-icon-area">
      <div class="hero-icon-ring">
        <svg viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
          <!-- Caduceus staff -->
          <line x1="32" y1="10" x2="32" y2="56" stroke="#f0c940" stroke-width="3" stroke-linecap="round"></line>
          <!-- Wings -->
          <path d="M32 16 Q20 10 10 14" stroke="#f0c940" stroke-width="2.2" fill="none" stroke-linecap="round"></path>
          <path d="M32 16 Q44 10 54 14" stroke="#f0c940" stroke-width="2.2" fill="none" stroke-linecap="round"></path>
          <!-- Snakes -->
          <path d="M32 20 Q24 25 32 30 Q40 35 32 40 Q24 45 32 50" stroke="#c9a227" stroke-width="2" fill="none" stroke-linecap="round"></path>
          <path d="M32 20 Q40 25 32 30 Q24 35 32 40 Q40 45 32 50" stroke="#c9a227" stroke-width="2" fill="none" stroke-linecap="round"></path>
          <!-- Center orb -->
          <circle cx="32" cy="32" r="3.5" fill="#f0c940"></circle>
          <!-- Top circle -->
          <circle cx="32" cy="13" r="3" stroke="#f0c940" stroke-width="1.5" fill="none"></circle>
        </svg>
      </div>
      <div class="hero-icon-label">Medical<br>Readiness</div>
    </div>

    <div class="hero-main">
      <div class="hero-tag">
        <div class="hero-tag-line"></div>
        <div class="hero-tag-text">U.S. Army Medical Readiness Command – West &nbsp;·&nbsp; Fort Leonard Wood, Missouri</div>
      </div>
      <div class="hero-heading">Deputy Commander<br>for <em>Readiness</em></div>
      <div class="hero-division">
        <div class="hero-division-rule"></div>
        <div class="hero-division-text">Military Medicine &nbsp;·&nbsp; Public Health &nbsp;·&nbsp; Physical Performance</div>
      </div>
      <div class="hero-mission-txt">
        "Supporting Military Readiness, Installation Health Protection, and Performance Optimization
        at the Army's Premier Engineer, Military Police, and Chemical Corps Training Installation."
      </div>
    </div>

    <div class="hero-right-panel">
      <div class="hrp-item">
        <div class="hrp-label">End State</div>
        <div class="hrp-value">Medical<br>Readiness</div>
      </div>
      <div class="hrp-item">
        <div class="hrp-label">Training Time</div>
        <div class="hrp-value">Preserved</div>
      </div>
      <div class="hrp-item">
        <div class="hrp-label">Outcome</div>
        <div class="hrp-value">Fit to Fight</div>
      </div>
    </div>

    <div class="hero-border-right"></div>
  </div>

  <!-- 4. Section Tabs -->
  <div class="section-tabs">

    <!-- Mil Medical Readiness -->
    <div class="tab-group">
      <div class="tab-group-hdr">Mil Medical Readiness</div>
      <div class="tab-links">
        <div class="tab-link">CTMC / PIT</div>
        <div class="tab-link">Military Readiness Program</div>
        <div class="tab-link">MEB / IDES</div>
      </div>
    </div>

    <!-- Public Health SL — two columns, centered -->
    <div class="tab-group ph-wide">
      <div class="tab-group-hdr">Public Health Service Line</div>
      <div class="tab-links-double">
        <div class="tab-link">Preventive Medicine</div>
        <div class="tab-link">Occupational Health</div>
        <div class="tab-link">Public Health Nursing</div>
        <div class="tab-link">Army Hearing Program</div>
        <div class="tab-link">Environmental Health</div>
        <div class="tab-link">Health Physics</div>
        <div class="tab-link">Industrial Hygiene</div>
      </div>
    </div>

    <!-- Physical Performance SL -->
    <div class="tab-group">
      <div class="tab-group-hdr">Physical Performance SL</div>
      <div class="tab-links">
        <div class="tab-link">Physical Therapy</div>
        <div class="tab-link">Occupational Therapy</div>
        <div class="tab-link">Audiology</div>
        <div class="tab-link">Chiropractic</div>
      </div>
    </div>

    <!-- Additional Programs -->
    <div class="tab-group">
      <div class="tab-group-hdr">Additional Programs</div>
      <div class="tab-links">
        <div class="tab-link">AFWC</div>
        <div class="tab-link">Chemical Surety Program</div>
      </div>
    </div>

  </div>

  <!-- 5. Priorities Section -->
  <div class="priorities-section">
    <div class="priorities-hdr">DCR Top Priorities</div>
    <div class="priorities-grid">

      <div class="p-card">
        <div class="p-circle">1</div>
        <div class="p-body">
          <div class="p-title">Optimize Readiness</div>
          <div class="p-sub">Soldier Medical Readiness</div>
        </div>
      </div>

      <div class="p-card">
        <div class="p-circle">2</div>
        <div class="p-body">
          <div class="p-title">Deliver High-Quality Care</div>
          <div class="p-sub">Patient Safety &amp; Excellence</div>
        </div>
      </div>

      <div class="p-card alert">
        <div class="p-circle">3</div>
        <div class="p-body">
          <div class="p-title">Health Protection</div>
          <div class="p-sub">⚠ Public Health Crisis Response</div>
        </div>
      </div>

      <div class="p-card">
        <div class="p-circle">4</div>
        <div class="p-body">
          <div class="p-title">Preventive Medicine</div>
          <div class="p-sub">Disease Prevention &amp; Surveillance</div>
        </div>
      </div>

      <div class="p-card">
        <div class="p-circle">5</div>
        <div class="p-body">
          <div class="p-title">MEPRS Compliance &amp; Resource Stewardship</div>
          <div class="p-sub">Cost Accountability</div>
        </div>
      </div>

      <div class="p-card">
        <div class="p-circle">6</div>
        <div class="p-body">
          <div class="p-title">Protect the Workforce</div>
          <div class="p-sub">Occupational Health &amp; Safety</div>
        </div>
      </div>

    </div>
  </div>

  <!-- 6. Motto Bar -->
  <div class="motto-bar">
    Ready <span>★</span> Reliable <span>★</span> Resilient <span>★</span> Fit to Fight
  </div>

  <!-- 7. Footer -->
  <div class="banner-footer">
    <div class="bf-left">General Leonard Wood Community Hospital &nbsp;|&nbsp; Fort Leonard Wood, Missouri</div>
    <div class="bf-center">
      <div class="bf-dot"></div>
      <div class="bf-dot" style="background:#8b0000;"></div>
      <div class="bf-dot"></div>
    </div>
    <div class="bf-right">U.S. Army Medical Readiness Command – West &nbsp;|&nbsp; MRC-West</div>
  </div>

</div>


</body></html>