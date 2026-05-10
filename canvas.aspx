<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>GLWACH Operational Dashboard – March 2026</title>
  <style>
    /* ── Reset & Base ── */
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    :root {
      --army-green:   #4a5e3a;
      --army-dark:    #2c3a22;
      --army-gold:    #c9a84c;
      --army-tan:     #f5f0e8;
      --green-light:  #e8f0e0;
      --red:          #b94040;
      --amber:        #d4852a;
      --blue:         #2a5f8f;
      --teal:         #2a7f7f;
      --purple:       #6a3d8f;
      --slate:        #445566;
      --card-bg:      #ffffff;
      --border:       #d0d8c8;
      --text-main:    #1a2010;
      --text-muted:   #5a6a4a;
      --radius:       8px;
      --shadow:       0 2px 8px rgba(0,0,0,0.10);
    }
    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      background: var(--army-tan);
      color: var(--text-main);
      min-height: 100vh;
    }

    /* ── Header ── */
    header {
      background: var(--army-dark);
      color: #fff;
      padding: 18px 32px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 16px;
      border-bottom: 4px solid var(--army-gold);
    }
    header .title-block h1 { font-size: 1.3rem; font-weight: 700; letter-spacing: .5px; }
    header .title-block p  { font-size: .82rem; color: #c8d8b8; margin-top: 2px; }
    header .meta { text-align: right; font-size: .8rem; color: #c8d8b8; line-height: 1.6; }
    header .meta strong { color: var(--army-gold); font-size: .95rem; display: block; }

    /* ── Tab nav ── */
    .tab-bar {
      background: var(--army-green);
      display: flex;
      flex-wrap: wrap;
      gap: 2px;
      padding: 8px 24px 0;
    }
    .tab-btn {
      background: rgba(255,255,255,.12);
      border: none;
      border-radius: 6px 6px 0 0;
      color: #d8e8c8;
      cursor: pointer;
      font-size: .78rem;
      font-weight: 600;
      padding: 7px 14px;
      transition: background .2s, color .2s;
      letter-spacing: .3px;
    }
    .tab-btn:hover   { background: rgba(255,255,255,.22); color: #fff; }
    .tab-btn.active  { background: var(--army-tan); color: var(--army-dark); }

    /* ── Main content ── */
    main { padding: 24px 28px; }
    .tab-panel { display: none; }
    .tab-panel.active { display: block; }

    /* ── Section title ── */
    .section-heading {
      font-size: 1.05rem;
      font-weight: 700;
      color: var(--army-dark);
      border-left: 5px solid var(--army-gold);
      padding-left: 10px;
      margin-bottom: 16px;
    }
    .sub-heading {
      font-size: .85rem;
      font-weight: 700;
      color: var(--army-green);
      margin: 18px 0 8px;
      text-transform: uppercase;
      letter-spacing: .4px;
    }

    /* ── Grid layouts ── */
    .grid-4 { display: grid; grid-template-columns: repeat(4, 1fr); gap: 14px; }
    .grid-3 { display: grid; grid-template-columns: repeat(3, 1fr); gap: 14px; }
    .grid-2 { display: grid; grid-template-columns: repeat(2, 1fr); gap: 14px; }
    .grid-auto { display: grid; grid-template-columns: repeat(auto-fill, minmax(260px,1fr)); gap: 14px; }
    @media(max-width:900px) {
      .grid-4,.grid-3 { grid-template-columns: repeat(2,1fr); }
    }
    @media(max-width:560px) {
      .grid-4,.grid-3,.grid-2 { grid-template-columns: 1fr; }
    }

    /* ── Cards ── */
    .card {
      background: var(--card-bg);
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      padding: 16px;
      border-top: 4px solid var(--army-green);
    }
    .card.gold   { border-top-color: var(--army-gold); }
    .card.blue   { border-top-color: var(--blue); }
    .card.teal   { border-top-color: var(--teal); }
    .card.red    { border-top-color: var(--red); }
    .card.purple { border-top-color: var(--purple); }
    .card.amber  { border-top-color: var(--amber); }
    .card.slate  { border-top-color: var(--slate); }

    .card-label {
      font-size: .72rem;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: .5px;
      color: var(--text-muted);
      margin-bottom: 6px;
    }
    .card-value {
      font-size: 2rem;
      font-weight: 800;
      color: var(--army-dark);
      line-height: 1.1;
    }
    .card-sub {
      font-size: .75rem;
      color: var(--text-muted);
      margin-top: 4px;
    }

    /* ── Status badge ── */
    .badge {
      display: inline-block;
      font-size: .7rem;
      font-weight: 700;
      border-radius: 20px;
      padding: 2px 10px;
      letter-spacing: .3px;
    }
    .badge-green  { background: #d4edda; color: #1a5c2a; }
    .badge-amber  { background: #fff3cd; color: #7a4800; }
    .badge-red    { background: #f8d7da; color: #721c24; }
    .badge-blue   { background: #d0e8f8; color: #0a3a5a; }
    .badge-grey   { background: #e2e6ea; color: #3a3a3a; }

    /* ── Action items table ── */
    .action-table { width: 100%; border-collapse: collapse; font-size: .8rem; }
    .action-table th {
      background: var(--army-dark);
      color: #fff;
      padding: 8px 10px;
      text-align: left;
      font-weight: 600;
      font-size: .75rem;
      letter-spacing: .3px;
    }
    .action-table td { padding: 7px 10px; border-bottom: 1px solid var(--border); vertical-align: top; }
    .action-table tr:nth-child(even) td { background: var(--green-light); }
    .action-table tr:hover td { background: #e0ecd4; }

    /* ── LOE cards ── */
    .loe-card {
      background: var(--card-bg);
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      padding: 18px;
      border-left: 6px solid var(--army-green);
    }
    .loe-card h3 { font-size: .92rem; font-weight: 700; margin-bottom: 6px; color: var(--army-dark); }
    .loe-card p  { font-size: .78rem; color: var(--text-muted); line-height: 1.5; }
    .loe-card ul { font-size: .78rem; color: var(--text-main); padding-left: 16px; margin-top: 6px; line-height: 1.7; }
    .loe-card.loe2 { border-left-color: var(--blue); }
    .loe-card.loe3 { border-left-color: var(--amber); }
    .loe-card.loe4 { border-left-color: var(--teal); }

    /* ── Section status cards ── */
    .section-card {
      background: var(--card-bg);
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      padding: 14px 16px;
    }
    .section-card .sc-header {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      margin-bottom: 8px;
    }
    .section-card .sc-name { font-weight: 700; font-size: .88rem; color: var(--army-dark); }
    .section-card .sc-poc  { font-size: .72rem; color: var(--text-muted); margin-top: 1px; }
    .section-card .sc-body { font-size: .77rem; color: var(--text-main); line-height: 1.55; }
    .section-card .sc-body ul { padding-left: 14px; margin-top: 4px; }
    .section-card .sc-issues {
      margin-top: 8px;
      background: #fff5f5;
      border-radius: 4px;
      padding: 6px 10px;
      font-size: .75rem;
      color: var(--red);
      border-left: 3px solid var(--red);
    }
    .section-card .sc-future {
      margin-top: 8px;
      background: #f0f7ff;
      border-radius: 4px;
      padding: 6px 10px;
      font-size: .75rem;
      color: var(--blue);
      border-left: 3px solid var(--blue);
    }

    /* ── Progress bar ── */
    .prog-wrap { margin-top: 8px; }
    .prog-label { font-size: .72rem; color: var(--text-muted); display: flex; justify-content: space-between; margin-bottom: 3px; }
    .prog-bar { height: 8px; border-radius: 4px; background: #e0e6d8; overflow: hidden; }
    .prog-fill { height: 100%; border-radius: 4px; background: var(--army-green); }

    /* ── Wait time pills ── */
    .wait-grid { display: flex; flex-wrap: wrap; gap: 8px; margin-top: 8px; }
    .wait-pill {
      background: var(--green-light);
      border-radius: 6px;
      padding: 5px 12px;
      font-size: .78rem;
      display: flex;
      flex-direction: column;
      align-items: center;
      min-width: 80px;
    }
    .wait-pill span:first-child { font-weight: 700; font-size: 1.1rem; color: var(--army-dark); }
    .wait-pill span:last-child  { font-size: .65rem; color: var(--text-muted); margin-top: 1px; }

    /* ── Timeline ── */
    .timeline { list-style: none; position: relative; padding-left: 20px; margin-top: 6px; }
    .timeline::before {
      content: '';
      position: absolute;
      left: 6px; top: 0; bottom: 0;
      width: 2px;
      background: var(--border);
    }
    .timeline li {
      position: relative;
      font-size: .77rem;
      margin-bottom: 8px;
      padding-left: 12px;
      line-height: 1.4;
    }
    .timeline li::before {
      content: '';
      position: absolute;
      left: -16px; top: 4px;
      width: 10px; height: 10px;
      border-radius: 50%;
      background: var(--army-green);
      border: 2px solid #fff;
    }
    .timeline li.urgent::before { background: var(--red); }
    .timeline li.future::before { background: var(--blue); }
    .timeline li .tl-date { font-weight: 700; color: var(--army-dark); }
    .timeline li .tl-detail { color: var(--text-muted); }

    /* ── Divider ── */
    .divider { height: 1px; background: var(--border); margin: 20px 0; }

    /* ── Footer ── */
    footer {
      text-align: center;
      font-size: .72rem;
      color: var(--text-muted);
      padding: 14px;
      border-top: 2px solid var(--border);
      margin-top: 10px;
    }
  </style>
</head>
<body>

<!-- ══════════════════ HEADER ══════════════════ -->
<header>
  <div class="title-block">
    <h1>⚕ General Leonard Wood Army Community Hospital</h1>
    <p>Operational Dashboard &nbsp;|&nbsp; Department of Public Health &amp; Supporting Sections</p>
  </div>
  <div class="meta">
    <strong>March 9, 2026</strong>
    Commander: LTC Kenneatta Jasper<br/>
    Next Meeting: April 13, 2026
  </div>
</header>

<!-- ══════════════════ TAB BAR ══════════════════ -->
<nav class="tab-bar">
  <button class="tab-btn active" onclick="showTab('overview',this)">Overview</button>
  <button class="tab-btn" onclick="showTab('loe',this)">LOEs</button>
  <button class="tab-btn" onclick="showTab('action',this)">Action Items</button>
  <button class="tab-btn" onclick="showTab('ides',this)">IDES / MEB</button>
  <button class="tab-btn" onclick="showTab('ctmc',this)">CTMC</button>
  <button class="tab-btn" onclick="showTab('srp',this)">SRP / PIT</button>
  <button class="tab-btn" onclick="showTab('ppsl',this)">PPSL</button>
  <button class="tab-btn" onclick="showTab('dph',this)">DPH Sections</button>
  <button class="tab-btn" onclick="showTab('enviro',this)">Env Health / IH</button>
  <button class="tab-btn" onclick="showTab('timeline',this)">Key Dates</button>
</nav>

<main>

<!-- ══════════════════ OVERVIEW ══════════════════ -->
<div id="tab-overview" class="tab-panel active">
  <p class="section-heading">Command Overview – Snapshot</p>

  <!-- KPI row -->
  <div class="grid-4" style="margin-bottom:18px;">
    <div class="card gold">
      <div class="card-label">Active IDES/MEB Cases</div>
      <div class="card-value">58</div>
      <div class="card-sub">+ 9 TDRL cases</div>
    </div>
    <div class="card blue">
      <div class="card-label">PEBLO Case Ratio</div>
      <div class="card-value">1:16</div>
      <div class="card-sub">Cases per PEBLO</div>
    </div>
    <div class="card amber">
      <div class="card-label">ARAP Survey Status</div>
      <div class="card-value">50+</div>
      <div class="card-sub">Additional surveys needed – NLT 13 MAR 26</div>
    </div>
    <div class="card red">
      <div class="card-label">Open Issues / Concerns</div>
      <div class="card-value">7</div>
      <div class="card-sub">Across active sections</div>
    </div>
  </div>

  <!-- PPSL Wait Times -->
  <p class="sub-heading">PPSL – Current Appointment Wait Times</p>
  <div class="card" style="margin-bottom:18px;">
    <div class="wait-grid">
      <div class="wait-pill"><span>28d</span><span>PT – Specialist</span></div>
      <div class="wait-pill"><span>29d</span><span>PT – Follow-up</span></div>
      <div class="wait-pill"><span>1d</span><span>PT – Procedure</span></div>
      <div class="wait-pill"><span>7d</span><span>OT – Specialist</span></div>
      <div class="wait-pill"><span>1d</span><span>OT – Follow-up</span></div>
      <div class="wait-pill"><span>4d</span><span>OT – Procedure</span></div>
      <div class="wait-pill"><span>15d</span><span>Chiro – Specialist</span></div>
      <div class="wait-pill"><span>4d</span><span>Chiro – Follow-up</span></div>
      <div class="wait-pill"><span>5d</span><span>Audio – Specialist</span></div>
      <div class="wait-pill"><span>1d</span><span>Audio – Follow-up</span></div>
      <div class="wait-pill"><span>13d</span><span>Audio – Procedure</span></div>
    </div>
  </div>

  <!-- Section status grid -->
  <p class="sub-heading">Section Operational Status</p>
  <div class="grid-4">
    <div class="card">
      <div class="card-label">Public Health</div>
      <span class="badge badge-amber">Ongoing Issues</span>
      <div class="card-sub" style="margin-top:6px;">PA hiring; OM provider scheduling; Supervisory IH on leave 4–6 wks</div>
    </div>
    <div class="card blue">
      <div class="card-label">AFWC</div>
      <span class="badge badge-blue">Active</span>
      <div class="card-sub" style="margin-top:6px;">DHA PHA meeting 4 MAR; PBAC equipment replacement 9 MAR</div>
    </div>
    <div class="card gold">
      <div class="card-label">Chem Surety</div>
      <span class="badge badge-green">On Track</span>
      <div class="card-sub" style="margin-top:6px;">CWC inspection complete; CSMR read-ahead compiled</div>
    </div>
    <div class="card teal">
      <div class="card-label">Occ Med/Health</div>
      <span class="badge badge-amber">Action Required</span>
      <div class="card-sub" style="margin-top:6px;">PA accepted perm offer (~May); T2COM inspection prep; Hospital move 8–9 APR</div>
    </div>
    <div class="card">
      <div class="card-label">Env Health</div>
      <span class="badge badge-green">NSTR</span>
      <div class="card-sub" style="margin-top:6px;">Ento collection began 1 MAR; DUWL testing underway</div>
    </div>
    <div class="card purple">
      <div class="card-label">Industrial Hygiene</div>
      <span class="badge badge-red">Issues</span>
      <div class="card-sub" style="margin-top:6px;">Supervisory IH out 4–6 wks; Table space insufficient at new hospital</div>
    </div>
    <div class="card amber">
      <div class="card-label">IDES / MEB</div>
      <span class="badge badge-blue">Active</span>
      <div class="card-sub" style="margin-top:6px;">58 IDES + 9 TDRL; Move to Bldg 1018 ~mid-APR</div>
    </div>
    <div class="card slate">
      <div class="card-label">Health Physics / Decon</div>
      <span class="badge badge-amber">Pending Approvals</span>
      <div class="card-sub" style="margin-top:6px;">Decommission Bldg 310; RAM shipment delayed; X-ray testing underway</div>
    </div>
  </div>

  <!-- Hospital Transition Banner -->
  <div style="margin-top:20px; background:var(--army-dark); color:#fff; border-radius:var(--radius); padding:14px 20px; display:flex; align-items:center; gap:14px;">
    <span style="font-size:1.8rem;">🏥</span>
    <div>
      <div style="font-weight:700; font-size:.95rem; color:var(--army-gold);">Hospital Transition – In Progress</div>
      <div style="font-size:.8rem; color:#c8d8b8; margin-top:3px;">
        Supply Room Set-up: 28 JAN – MAR 26 &nbsp;|&nbsp; OH Equipment Move: 8–9 APR &nbsp;|&nbsp;
        Bldg 1018 Remodel awarded 1 MAR; target completion 1 APR &nbsp;|&nbsp; RAM move to new facility pending approval
      </div>
    </div>
  </div>
</div>

<!-- ══════════════════ LOE ══════════════════ -->
<div id="tab-loe" class="tab-panel">
  <p class="section-heading">FY26 Lines of Effort (LOE) – Way Ahead</p>
  <div class="grid-2">
    <div class="loe-card">
      <h3>LOE 1 – Operational Readiness &amp; Continuity</h3>
      <p>Clinics, programs, and inspections execute without degradation. No single point of failure in mission-essential functions.</p>
      <ul>
        <li>Operational throughput during hospital transition</li>
        <li>Execute inspections on schedule</li>
        <li>BUR used as a readiness tool – not a paperwork drill</li>
        <li><strong>Leaders:</strong> Anticipate gaps; cross-coverage &amp; SOP discipline non-negotiable</li>
      </ul>
    </div>
    <div class="loe-card loe2">
      <h3>LOE 2 – Workforce Readiness &amp; Accountability</h3>
      <p>Right people, trained, credentialed, and available. Predictable schedules despite turnover.</p>
      <ul>
        <li>Mitigate PCS, retirements, leave &amp; vacancies with deliberate coverage plans</li>
        <li>Accelerate onboarding and cross-training</li>
        <li>Professional development aligned to mission need</li>
        <li><strong>Leaders:</strong> Own your manning picture; develop people while protecting the mission</li>
      </ul>
    </div>
    <div class="loe-card loe3">
      <h3>LOE 3 – Quality, Safety &amp; Risk Reduction</h3>
      <p>Compliance supports readiness; it does not compete with it. Risks identified early and managed deliberately.</p>
      <ul>
        <li>Sustain QA/QI programs</li>
        <li>Maintain surveillance, reporting, and documentation standards</li>
        <li>Standardize processes ahead of new facility move</li>
        <li><strong>Leaders:</strong> No surprises. Fix systems, not symptoms.</li>
      </ul>
    </div>
    <div class="loe-card loe4">
      <h3>LOE 4 – Communication, Discipline &amp; Trust</h3>
      <p>Leaders set the tone; teams understand the "why." Clear, timely, consistent communication.</p>
      <ul>
        <li>Routine battle rhythm (workgroups, inspections, AARs)</li>
        <li>Transparent decision-making tied to readiness outcomes</li>
        <li>Reinforce standards with respect and consistency</li>
        <li><strong>Leaders:</strong> Lead with optimism and discipline. Build trust through action.</li>
      </ul>
    </div>
  </div>
  <div style="margin-top:14px; background:#fff; border-radius:var(--radius); padding:10px 14px; font-size:.75rem; color:var(--text-muted); border-left:4px solid var(--army-gold);">
    ⚠ Quality Assurance Document under 10 USC §1102
  </div>
</div>

<!-- ══════════════════ ACTION ITEMS ══════════════════ -->
<div id="tab-action" class="tab-panel">
  <p class="section-heading">Action Item Tracker – March 2026</p>
  <div style="overflow-x:auto;">
    <table class="action-table">
      <thead>
        <tr>
          <th>Action Item / Task</th>
          <th>POC / AO</th>
          <th>Status / Date</th>
          <th>Next Step / Expectation</th>
          <th>Flag</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Hospital Transition Planning</td>
          <td>All Sections</td>
          <td>Ongoing</td>
          <td>28 JAN – MAR 26 Supply Room Set-up</td>
          <td><span class="badge badge-amber">Ongoing</span></td>
        </tr>
        <tr>
          <td>GLWACH Hearing Tasker</td>
          <td>CPT Ramirez</td>
          <td>Ongoing</td>
          <td>Training required</td>
          <td><span class="badge badge-amber">Ongoing</span></td>
        </tr>
        <tr>
          <td>GLWACH Tasker 25-134 RRC CPI Training</td>
          <td>All Supervisors</td>
          <td>Officers &amp; Civilians</td>
          <td>JKO DHA-US1372-Virtual – All Staff; RRC CPI Training (3 hrs); Status check 24 MAR 26</td>
          <td><span class="badge badge-blue">Due 24 MAR</span></td>
        </tr>
        <tr>
          <td>DPMAP Supervisor Appraisal Training &amp; Updates</td>
          <td>All Supervisors</td>
          <td>10 MAR 26</td>
          <td>PY26: 1 APR 25 – 31 MAR 26</td>
          <td><span class="badge badge-red">Due 10 MAR</span></td>
        </tr>
        <tr>
          <td>BUR (Bottom-Up Review)</td>
          <td>Supervisors</td>
          <td>Ongoing</td>
          <td>Pending strategic guidance from deputies</td>
          <td><span class="badge badge-amber">Pending</span></td>
        </tr>
        <tr>
          <td>Interruption in Contingency Classes</td>
          <td>All Sections</td>
          <td>17 MAR – 20 MAY 26</td>
          <td>BLS: 11 MAR 26 &nbsp;|&nbsp; ALS: 12 MAR 26</td>
          <td><span class="badge badge-amber">Scheduled</span></td>
        </tr>
        <tr>
          <td>MASCAL Events</td>
          <td>All Sections</td>
          <td>TBD</td>
          <td>External Full-Scale Exercise date pending; Review EAPs</td>
          <td><span class="badge badge-grey">TBD</span></td>
        </tr>
        <tr>
          <td>Heat Injury Prevention Forum</td>
          <td>DPH</td>
          <td>07 APR 26</td>
          <td>Educational support to be provided</td>
          <td><span class="badge badge-blue">07 APR</span></td>
        </tr>
        <tr>
          <td>Army Readiness Assessment Program (ARAP) Survey</td>
          <td>All Sections</td>
          <td>NLT 13 MAR 26</td>
          <td>Brief personnel on purpose; ensure survey reaches lowest level. <strong>Need 50+ more responses.</strong></td>
          <td><span class="badge badge-red">Urgent</span></td>
        </tr>
        <tr>
          <td>OPORD 26-020 MSCoE Prevention Audit</td>
          <td>DPH</td>
          <td>05 APR – 16 MAY 26</td>
          <td>Submit all required data via survey links</td>
          <td><span class="badge badge-blue">05 APR</span></td>
        </tr>
        <tr>
          <td>OPORD 26-033 Surety Management Review (SMR)</td>
          <td>DPH</td>
          <td>—</td>
          <td>Attend all IPRs</td>
          <td><span class="badge badge-amber">Ongoing</span></td>
        </tr>
      </tbody>
    </table>
  </div>
  <div style="margin-top:10px; font-size:.72rem; color:var(--text-muted);">CUI Category: OPSEC</div>
</div>

<!-- ══════════════════ IDES / MEB ══════════════════ -->
<div id="tab-ides" class="tab-panel">
  <p class="section-heading">IDES / MEB – Mr. Storie</p>
  <div class="grid-4" style="margin-bottom:20px;">
    <div class="card gold">
      <div class="card-label">Active IDES/MEB Cases</div>
      <div class="card-value">58</div>
      <div class="card-sub">Currently processing</div>
    </div>
    <div class="card blue">
      <div class="card-label">TDRL Cases</div>
      <div class="card-value">9</div>
      <div class="card-sub">Currently managed</div>
    </div>
    <div class="card">
      <div class="card-label">Total Caseload</div>
      <div class="card-value">67</div>
      <div class="card-sub">IDES/MEB + TDRL</div>
    </div>
    <div class="card red">
      <div class="card-label">PEBLO Case Ratio</div>
      <div class="card-value">1:16</div>
      <div class="card-sub">Cases per PEBLO</div>
    </div>
  </div>

  <div class="grid-2">
    <div class="section-card">
      <div class="sc-header">
        <div>
          <div class="sc-name">Current Operations</div>
        </div>
        <span class="badge badge-blue">Active</span>
      </div>
      <div class="sc-body">
        <ul>
          <li>58 IDES-MEB + 9 TDRL cases in processing</li>
          <li>1 PEBLO per 16 IDES-MEB/TDRL cases</li>
          <li>Coordinating personnel &amp; equipment move to Bldg 1018</li>
          <li>Contract for Exam Room remodel awarded 01 MAR 26</li>
        </ul>
      </div>
    </div>
    <div class="section-card">
      <div class="sc-header">
        <div>
          <div class="sc-name">Future Operations</div>
        </div>
        <span class="badge badge-amber">Pending</span>
      </div>
      <div class="sc-future">
        <ul>
          <li>On temp promotion orders as PEBLO Supervisor until 11 MAY 26</li>
          <li>Awaiting decision on permanent backfill of PEBLO Supervisor position</li>
          <li>Target move to Bldg 1018: ~2nd or 3rd week of APR 26</li>
          <li>Exam room remodel target complete: 01 APR 26</li>
        </ul>
      </div>
    </div>
  </div>
</div>

<!-- ══════════════════ CTMC ══════════════════ -->
<div id="tab-ctmc" class="tab-panel">
  <p class="section-heading">CTMC – MAJ Rein / SFC Robinson</p>
  <div class="grid-3" style="margin-bottom:18px;">
    <div class="card">
      <div class="card-label">Patient Throughput (MTD)</div>
      <div class="card-value">—</div>
      <div class="card-sub">Total seen / daily average / trend</div>
    </div>
    <div class="card blue">
      <div class="card-label">Nurse-Led Protocol Visits</div>
      <div class="card-value">—</div>
      <div class="card-sub">% managed via nursing protocols</div>
    </div>
    <div class="card gold">
      <div class="card-label">Avg Patient Wait Time</div>
      <div class="card-value">—</div>
      <div class="card-sub">Access to care metric</div>
    </div>
  </div>
  <div class="section-card">
    <div class="sc-header">
      <div class="sc-name">Dashboard Metrics Framework</div>
    </div>
    <div class="sc-body">
      <strong>Clinical Utilization:</strong>
      <ul>
        <li>Nurse-Led Protocol Visits vs. Provider Visits</li>
        <li>% Managed via Nursing Protocols</li>
        <li>RTD vs quarters trend</li>
      </ul>
      <strong>Access to Care:</strong>
      <ul>
        <li>Average patient wait times</li>
        <li>Trends in illnesses seen</li>
      </ul>
    </div>
    <div class="sc-future">No current/future operations reported – data pending next update cycle.</div>
  </div>
</div>

<!-- ══════════════════ SRP / PIT ══════════════════ -->
<div id="tab-srp" class="tab-panel">
  <p class="section-heading">SRP – Adelle George / SSG Satterfield</p>
  <div class="grid-3" style="margin-bottom:18px;">
    <div class="card">
      <div class="card-label">Total Soldiers Processed (MTD)</div>
      <div class="card-value">—</div>
      <div class="card-sub">Monthly throughput</div>
    </div>
    <div class="card blue">
      <div class="card-label">Avg Soldiers/Day</div>
      <div class="card-value">—</div>
      <div class="card-sub">Daily processing rate</div>
    </div>
    <div class="card amber">
      <div class="card-label">Scheduled but Not Seen</div>
      <div class="card-value">—</div>
      <div class="card-sub">No-show / gap tracking</div>
    </div>
  </div>
  <div class="section-card" style="margin-bottom:14px;">
    <div class="sc-header"><div class="sc-name">BOLC Support &amp; COMP Activity Framework</div></div>
    <div class="sc-body">
      <ul>
        <li>Classes supported (MTD)</li>
        <li>Soldiers processed per class (avg)</li>
        <li>COMP 1/2/3 PHA completed</li>
        <li>In/Out-processed activity</li>
        <li>Group sessions conducted</li>
        <li>Individual screening conducted</li>
        <li>Average wait time</li>
      </ul>
    </div>
    <div class="sc-future">No current/future operations reported – data pending next update cycle.</div>
  </div>

  <div class="divider"></div>
  <p class="section-heading">PIT – Sarah Keelin / SSG Martin</p>
  <div class="grid-3" style="margin-bottom:18px;">
    <div class="card">
      <div class="card-label">Total Trainees Processed (MTD)</div>
      <div class="card-value">—</div>
      <div class="card-sub">Monthly throughput</div>
    </div>
    <div class="card blue">
      <div class="card-label">Twin Shots – Avg Throughput</div>
      <div class="card-value">—</div>
      <div class="card-sub">Immunization rate</div>
    </div>
    <div class="card amber">
      <div class="card-label">MEDPROS Manual Updates</div>
      <div class="card-value">—</div>
      <div class="card-sub">Charts manually updated</div>
    </div>
  </div>
  <div class="section-card">
    <div class="sc-body">
      <strong>Medical Readiness Metrics:</strong>
      <ul>
        <li>Trends with waivers</li>
        <li>Average trainees requiring CTMC/BH assessment for clearance</li>
        <li>MEDPROS charts manually updated</li>
        <li>Program audits completed</li>
      </ul>
    </div>
    <div class="sc-future">No current/future operations reported – data pending next update cycle.</div>
  </div>
</div>

<!-- ══════════════════ PPSL ══════════════════ -->
<div id="tab-ppsl" class="tab-panel">
  <p class="section-heading">PPSL – CPT Frey / SSG Bostic</p>

  <!-- Wait time dashboard -->
  <p class="sub-heading">Current Appointment Wait Times</p>
  <div class="grid-4" style="margin-bottom:18px;">
    <div class="card">
      <div class="card-label">PT – Specialist</div>
      <div class="card-value">28 <span style="font-size:1rem;">days</span></div>
      <div class="prog-wrap">
        <div class="prog-bar"><div class="prog-fill" style="width:93%;background:var(--red);"></div></div>
      </div>
    </div>
    <div class="card">
      <div class="card-label">PT – Follow-up (FTR)</div>
      <div class="card-value">29 <span style="font-size:1rem;">days</span></div>
      <div class="prog-wrap">
        <div class="prog-bar"><div class="prog-fill" style="width:97%;background:var(--red);"></div></div>
      </div>
    </div>
    <div class="card">
      <div class="card-label">PT – Procedure</div>
      <div class="card-value">1 <span style="font-size:1rem;">day</span></div>
      <div class="prog-wrap">
        <div class="prog-bar"><div class="prog-fill" style="width:3%;"></div></div>
      </div>
    </div>
    <div class="card blue">
      <div class="card-label">OT – Specialist</div>
      <div class="card-value">7 <span style="font-size:1rem;">days</span></div>
      <div class="prog-wrap">
        <div class="prog-bar"><div class="prog-fill" style="width:23%;background:var(--blue);"></div></div>
      </div>
    </div>
    <div class="card blue">
      <div class="card-label">OT – Follow-up</div>
      <div class="card-value">1 <span style="font-size:1rem;">day</span></div>
      <div class="prog-wrap">
        <div class="prog-bar"><div class="prog-fill" style="width:3%;background:var(--blue);"></div></div>
      </div>
    </div>
    <div class="card blue">
      <div class="card-label">OT – Procedure</div>
      <div class="card-value">4 <span style="font-size:1rem;">days</span></div>
      <div class="prog-wrap">
        <div class="prog-bar"><div class="prog-fill" style="width:13%;background:var(--blue);"></div></div>
      </div>
    </div>
    <div class="card teal">
      <div class="card-label">Chiro – Specialist</div>
      <div class="card-value">15 <span style="font-size:1rem;">days</span></div>
      <div class="prog-wrap">
        <div class="prog-bar"><div class="prog-fill" style="width:50%;background:var(--teal);"></div></div>
      </div>
    </div>
    <div class="card teal">
      <div class="card-label">Chiro – Follow-up</div>
      <div class="card-value">4 <span style="font-size:1rem;">days</span></div>
      <div class="prog-wrap">
        <div class="prog-bar"><div class="prog-fill" style="width:13%;background:var(--teal);"></div></div>
      </div>
    </div>
    <div class="card gold">
      <div class="card-label">Audio – Specialist</div>
      <div class="card-value">5 <span style="font-size:1rem;">days</span></div>
      <div class="prog-wrap">
        <div class="prog-bar"><div class="prog-fill" style="width:17%;background:var(--army-gold);"></div></div>
      </div>
    </div>
    <div class="card gold">
      <div class="card-label">Audio – Follow-up</div>
      <div class="card-value">1 <span style="font-size:1rem;">day</span></div>
      <div class="prog-wrap">
        <div class="prog-bar"><div class="prog-fill" style="width:3%;background:var(--army-gold);"></div></div>
      </div>
    </div>
    <div class="card gold">
      <div class="card-label">Audio – Procedure</div>
      <div class="card-value">13 <span style="font-size:1rem;">days</span></div>
      <div class="prog-wrap">
        <div class="prog-bar"><div class="prog-fill" style="width:43%;background:var(--army-gold);"></div></div>
      </div>
    </div>
  </div>

  <!-- Personnel changes -->
  <p class="sub-heading">Personnel Changes – Future Operations</p>
  <div class="grid-2">
    <div class="section-card">
      <div class="sc-header"><div class="sc-name">Departures</div><span class="badge badge-red">Action Required</span></div>
      <div class="sc-body">
        <ul>
          <li>Dr. Grandgeorge – Retiring <strong>SEP 26</strong></li>
          <li>SSG Bonsu (68L) – Departing <strong>AUG 26</strong></li>
        </ul>
      </div>
    </div>
    <div class="section-card">
      <div class="sc-header"><div class="sc-name">Arrivals / Returns</div><span class="badge badge-green">Incoming</span></div>
      <div class="sc-body">
        <ul>
          <li>LTC Collinsworth (PPSL Chief) – Arriving <strong>Early AUG 26</strong></li>
          <li>CPT Woodruff (65B) – Arriving <strong>DEC 26</strong></li>
          <li>Dr. Urban (CTMC PT) – Start <strong>20 APR 26</strong></li>
          <li>Dr. Lancaster – Returning from PPL <strong>06 APR 26</strong></li>
        </ul>
      </div>
    </div>
  </div>
</div>

<!-- ══════════════════ DPH SECTIONS ══════════════════ -->
<div id="tab-dph" class="tab-panel">
  <p class="section-heading">DPH Section Updates – March 2026</p>
  <div class="grid-auto">

    <!-- AFWC -->
    <div class="section-card">
      <div class="sc-header">
        <div>
          <div class="sc-name">AFWC (Army Fitness &amp; Wellness)</div>
          <div class="sc-poc">CPT Vu / SFC Laswell</div>
        </div>
        <span class="badge badge-blue">Active</span>
      </div>
      <div class="sc-body">
        <strong>Current:</strong>
        <ul>
          <li>Meeting with DHA – PHA AFWC: 04 MAR 26</li>
          <li>PBAC for new In-body &amp; Fitmate replacements: 09 MAR 26</li>
        </ul>
      </div>
      <div class="sc-future">
        <strong>Future:</strong> Turn in unused/redundant equipment; Expand utilization via education
      </div>
    </div>

    <!-- Hearing -->
    <div class="section-card">
      <div class="sc-header">
        <div>
          <div class="sc-name">Hearing Program</div>
          <div class="sc-poc">CPT Ramirez</div>
        </div>
        <span class="badge badge-grey">No Update</span>
      </div>
      <div class="sc-body">No current operations reported this cycle.</div>
    </div>

    <!-- Chem Surety -->
    <div class="section-card">
      <div class="sc-header">
        <div>
          <div class="sc-name">Chem Surety</div>
          <div class="sc-poc">John Jackson</div>
        </div>
        <span class="badge badge-green">On Track</span>
      </div>
      <div class="sc-body">
        <strong>Current:</strong>
        <ul>
          <li>CWC inspection – Complete ✔</li>
          <li>CSMR read-ahead documentation compiled</li>
          <li>CIMRA 2/26 AAR (Response to fire)</li>
          <li>CIMRA 3/26 IPR (MPE)</li>
        </ul>
      </div>
      <div class="sc-future">
        <strong>Future:</strong><br/>
        MSCoE Quarterly Surety Inspection: 26 MAR 25<br/>
        T2COM CSMR IPR: 10 MAR 26<br/>
        T2COM CSMR: 13–17 APR 26
      </div>
    </div>

    <!-- Occ Med -->
    <div class="section-card">
      <div class="sc-header">
        <div>
          <div class="sc-name">Occ Med / Health</div>
          <div class="sc-poc">Dr. McCall / Samantha Visser</div>
        </div>
        <span class="badge badge-amber">Action Required</span>
      </div>
      <div class="sc-body">
        <strong>Future:</strong>
        <ul>
          <li>Catch up on Dr. McCall's workload per guided plan</li>
          <li>OH equipment on reuse list</li>
          <li>RN RPA listed on USAJobs</li>
          <li>PA accepted perm offer – begin ~end of May</li>
          <li>T2COM inspection prep for CDTF</li>
          <li>Begin annual DPMAP evaluations</li>
          <li>LTBI/Travel Clinic – May</li>
          <li>CDTF T2COM inspection – April</li>
          <li>Hospital move for OH: 8–9 APR</li>
          <li>Develop PRP process for medical staff through OH</li>
          <li>New PA training plan development</li>
        </ul>
      </div>
      <div class="sc-issues">Issues: Provider schedule | PRP program | OH equipment reuse list</div>
    </div>

    <!-- PH Nursing/EPI -->
    <div class="section-card">
      <div class="sc-header">
        <div>
          <div class="sc-name">PH Nursing / EPI</div>
          <div class="sc-poc">CPT Holt</div>
        </div>
        <span class="badge badge-grey">No Update</span>
      </div>
      <div class="sc-body">No current/future operations reported this cycle.</div>
    </div>

    <!-- Health Physics / Decon -->
    <div class="section-card">
      <div class="sc-header">
        <div>
          <div class="sc-name">Health Physics / Decon</div>
          <div class="sc-poc">CPT Davis</div>
        </div>
        <span class="badge badge-amber">Pending Approvals</span>
      </div>
      <div class="sc-body">
        <strong>Current:</strong>
        <ul>
          <li>Decommission Bldg 310</li>
          <li>Move RAM to new facility</li>
          <li>Convert new hospital to storage only</li>
          <li>Decon Team: Paused for priority</li>
          <li>Ensuring all new X-ray equipment is tested</li>
          <li>Scheduling in-person Radiation Safety Training</li>
        </ul>
      </div>
      <div class="sc-issues">
        Issues:<br/>
        – Service Change Request Approval pending<br/>
        – Approval/Vacancy to decommission Bldg 310<br/>
        – RAM shipment approval delayed (coordination complete)
      </div>
    </div>

  </div>
</div>

<!-- ══════════════════ ENVIRO / IH ══════════════════ -->
<div id="tab-enviro" class="tab-panel">
  <p class="section-heading">Environmental Health – MAJ Graham</p>
  <div class="grid-2" style="margin-bottom:18px;">
    <div class="section-card">
      <div class="sc-header">
        <div class="sc-name">Current Operations</div>
        <span class="badge badge-green">NSTR</span>
      </div>
      <div class="sc-body">
        <ul>
          <li>Ento Collection Program – began 1 MAR 26</li>
          <li>Quarterly DUWL Testing (Roll: 3 MAR; Boak &amp; GLWACH: 10 MAR)</li>
          <li>Drinking Water Lab SimPlate Certification</li>
          <li>Post Icehouse review</li>
          <li>LRC Pest Control</li>
          <li>DSOP – New Drill SGT in-processing</li>
        </ul>
      </div>
    </div>
    <div class="section-card">
      <div class="sc-header">
        <div class="sc-name">Future Operations</div>
      </div>
      <div class="sc-future">
        <ul>
          <li>Food Handlers Class: 1 APR 26</li>
          <li>RMW Inspections (1st in GLWACH)</li>
          <li>Missouri DNR Water Lab Audit for new hospital</li>
          <li>14th MP Hot Weather Tng Support: APR (TBD)</li>
        </ul>
      </div>
    </div>
  </div>

  <!-- Env Health metrics framework -->
  <div class="grid-3" style="margin-bottom:20px;">
    <div class="card teal">
      <div class="card-label">Food Establishment Inspections</div>
      <div class="card-value">—</div>
      <div class="card-sub">MTD tracking</div>
    </div>
    <div class="card teal">
      <div class="card-label">Barracks Inspections</div>
      <div class="card-value">—</div>
      <div class="card-sub">MTD tracking</div>
    </div>
    <div class="card teal">
      <div class="card-label">Vector Surveillance Collections</div>
      <div class="card-value">—</div>
      <div class="card-sub">Ento program (began 1 MAR)</div>
    </div>
  </div>

  <div class="divider"></div>
  <p class="section-heading">Industrial Hygiene – Ralph Armistead</p>
  <div class="grid-2" style="margin-bottom:18px;">
    <div class="section-card">
      <div class="sc-header">
        <div class="sc-name">Current Operations</div>
        <span class="badge badge-amber">Issues Present</span>
      </div>
      <div class="sc-body">
        <ul>
          <li>DFAC Chlorine memo</li>
          <li>Old hospital MRI noise survey (per command request)</li>
          <li>Briefing with command team</li>
          <li>TACOM soldering memo</li>
          <li>General base surveys</li>
          <li>Mock patient trials at new hospital</li>
          <li>Fire station survey</li>
          <li>HazCom training: 9 MAR 26</li>
        </ul>
      </div>
      <div class="sc-issues">
        Issues:<br/>
        – Smoke tube detectors nearly exhausted<br/>
        – Table space for respiratory clearance insufficient at new hospital<br/>
        – DMLSS Account issue<br/>
        – Supervisory IH out 4–6 weeks (con leave)
      </div>
    </div>
    <div class="section-card">
      <div class="sc-header"><div class="sc-name">Future Operations</div></div>
      <div class="sc-future">
        <ul>
          <li>Compressor testing</li>
          <li>Hospital isolation/TB room ventilation</li>
          <li>Hospital lab ventilation assessment</li>
          <li>CDTF lab hoods</li>
          <li>CDTF shop survey(s)</li>
          <li>Air Force follow-up testing scheduling</li>
          <li>Noise survey (w/ Safety)</li>
        </ul>
      </div>
    </div>
  </div>

  <div class="divider"></div>
  <p class="section-heading">APHN / Public Health</p>
  <div class="grid-3">
    <div class="card blue">
      <div class="card-label">Patient Encounters / Consultations</div>
      <div class="card-value">—</div>
      <div class="card-sub">MTD tracking</div>
    </div>
    <div class="card blue">
      <div class="card-label">Health Ed Sessions Conducted</div>
      <div class="card-value">—</div>
      <div class="card-sub">Prevention &amp; outreach</div>
    </div>
    <div class="card blue">
      <div class="card-label">Reportable Cases Investigated</div>
      <div class="card-value">—</div>
      <div class="card-sub">Communicable disease follow-up</div>
    </div>
  </div>
</div>

<!-- ══════════════════ KEY DATES ══════════════════ -->
<div id="tab-timeline" class="tab-panel">
  <p class="section-heading">Key Dates &amp; Upcoming Events</p>
  <div class="grid-2">
    <div class="card">
      <p class="sub-heading" style="margin-top:0;">March 2026</p>
      <ul class="timeline">
        <li class="urgent"><span class="tl-date">9 MAR:</span> <span class="tl-detail">HazCom Training (IH) | DPMAP Supervisor Training due | Monthly Battle Rhythm Meeting</span></li>
        <li><span class="tl-date">10 MAR:</span> <span class="tl-detail">DPMAP Updates deadline | DUWL Testing (Boak &amp; GLWACH) | T2COM CSMR IPR</span></li>
        <li><span class="tl-date">11 MAR:</span> <span class="tl-detail">BLS Training</span></li>
        <li><span class="tl-date">12 MAR:</span> <span class="tl-detail">ALS Training</span></li>
        <li class="urgent"><span class="tl-date">13 MAR:</span> <span class="tl-detail">ARAP Survey closes – Need 50+ more responses!</span></li>
        <li><span class="tl-date">17–20 MAY:</span> <span class="tl-detail">Contingency class interruption window begins</span></li>
        <li class="future"><span class="tl-date">24 MAR:</span> <span class="tl-detail">RRC CPI Training status check</span></li>
        <li class="future"><span class="tl-date">25–26 MAR:</span> <span class="tl-detail">MSCoE Quarterly Surety Inspection</span></li>
      </ul>
    </div>
    <div class="card blue">
      <p class="sub-heading" style="margin-top:0;">April – May 2026</p>
      <ul class="timeline">
        <li class="future"><span class="tl-date">1 APR:</span> <span class="tl-detail">Food Handlers Class | Target Bldg 1018 exam room remodel complete</span></li>
        <li class="future"><span class="tl-date">5 APR:</span> <span class="tl-detail">OPORD 26-020 MSCoE Prevention Audit begins</span></li>
        <li class="future"><span class="tl-date">6 APR:</span> <span class="tl-detail">Dr. Lancaster returns from PPL</span></li>
        <li class="future"><span class="tl-date">7 APR:</span> <span class="tl-detail">Heat Injury Prevention Forum (DPH)</span></li>
        <li class="future"><span class="tl-date">8–9 APR:</span> <span class="tl-detail">Hospital move for OH equipment</span></li>
        <li class="future"><span class="tl-date">13 APR:</span> <span class="tl-detail">Next Monthly Meeting</span></li>
        <li class="future"><span class="tl-date">13–17 APR:</span> <span class="tl-detail">T2COM CSMR</span></li>
        <li class="future"><span class="tl-date">20 APR:</span> <span class="tl-detail">Dr. Urban (CTMC PT) start date</span></li>
        <li class="future"><span class="tl-date">5 APR–16 MAY:</span> <span class="tl-detail">OPORD 26-020 Prevention Audit window</span></li>
        <li class="future"><span class="tl-date">17 MAR–20 MAY:</span> <span class="tl-detail">Interruption in contingency classes</span></li>
        <li class="future"><span class="tl-date">11 MAY:</span> <span class="tl-detail">PEBLO Supervisor temp promotion orders end</span></li>
        <li class="future"><span class="tl-date">~End May:</span> <span class="tl-detail">New PA begin date (Occ Health)</span></li>
        <li class="future"><span class="tl-date">May:</span> <span class="tl-detail">LTBI/Travel Clinic (Occ Med)</span></li>
      </ul>
    </div>
  </div>
</div>

</main>

<footer>
  General Leonard Wood Army Community Hospital &nbsp;|&nbsp; March 9, 2026 &nbsp;|&nbsp;
  Commander: LTC Kenneatta Jasper &nbsp;|&nbsp;
  Quality Assurance Document – 10 USC §1102 &nbsp;|&nbsp; CUI Category: OPSEC
</footer>

<script>
  function showTab(id, btn) {
    document.querySelectorAll('.tab-panel').forEach(p => p.classList.remove('active'));
    document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
    document.getElementById('tab-' + id).classList.add('active');
    btn.classList.add('active');
  }
</script>
</body>
</html>