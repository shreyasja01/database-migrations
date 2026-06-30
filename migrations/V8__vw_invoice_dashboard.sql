DROP VIEW vw_invoice_dashboard;
CREATE OR REPLACE VIEW vw_invoice_dashboard AS
SELECT
    inv.Id,
    inv.InvoiceNumber,
    inv.InvoiceDate,
    inv.ProcessId,
    inv.ClientId,
    inv.StatusId,
    inv.BillingMonth,
    inv.BillingYear,
    inv.FinalInvAmount,

    prc.Name AS ProcessName,

    cli.Client_Name,

    pkl.PickListItem_Name AS StatusName,
	inv.CreatedBy,
    emp.Employee_Name AS CreatedByName

FROM trn_1point1_invoice inv

LEFT JOIN mst_1point1_process prc
    ON prc.Id = inv.ProcessId

LEFT JOIN mst_1point1_client cli
    ON cli.Id = prc.ClientId

LEFT JOIN mst_picklist_item pkl
    ON pkl.Id = inv.StatusId

LEFT JOIN mst_employee emp
    ON emp.ID = inv.CreatedBy;