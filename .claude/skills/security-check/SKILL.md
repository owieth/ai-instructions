---
name: security-check
description: Thoroughly investigate the current feature for security problems, permission gaps. Act like a red-team pen-tester. Suggest fixes.
---

# Security Check

Thoroughly investigate the current feature for security problems, permission gaps. Act like a red-team pen-tester. Suggest fixes.

## When to Use

Run before you commit. Use this skill to perform a comprehensive security audit of your code changes.

## Approach

Act as a red-team pen-tester and:

1. **Identify Security Vulnerabilities**
   - Injection attacks (SQL, XSS, command injection)
   - Authentication and authorization flaws
   - Insecure direct object references
   - Security misconfigurations
   - Sensitive data exposure
   - Missing function-level access control
   - Cross-site request forgery (CSRF)
   - Using components with known vulnerabilities
   - Insecure deserialization

2. **Check Permission Gaps**
   - Missing authorization checks
   - Privilege escalation risks
   - Inadequate access controls
   - Broken access control patterns
   - Insufficient input validation

3. **Suggest Fixes**
   - Provide specific, actionable remediation steps
   - Prioritize critical vulnerabilities
   - Include code examples where applicable

## Output Format

- List vulnerabilities by severity (Critical, High, Medium, Low)
- Include file paths and line numbers
- Explain the security risk
- Provide concrete fix suggestions
