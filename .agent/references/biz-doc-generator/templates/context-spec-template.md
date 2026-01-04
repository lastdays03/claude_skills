# Document Context Specification: {{DocName}}

## 1. Document Type
- **Format**: [Word (`.docx`) | Excel (`.xlsx`) | PDF (`.pdf`)]
- **Library**: [docxtpl | openpyxl | WeasyPrint]

## 2. Template Variables (Context)
Define the variables to be injected into the template.

| Variable Name | Type | Description | Example |
| :--- | :--- | :--- | :--- |
| `{{ company_name }}` | String | Name of the client company | "Acme Corp" |
| `{{ report_date }}` | Date | Date of report generation | "2024-01-01" |
| `{{ items }}` | List[Dict] | List of line items | `[{'name': 'Item A', 'price': 100}]` |
| `{{ total_price }}` | Float | Sum of all items | 100.0 |

## 3. Logic Requirements
- **Calculations**: (e.g., Sum of `items` must match `total_price`)
- **Formatting**: (e.g., Currency format for prices `$1,000`)
