
DROP TRIGGER trg_after_update_mst_1point1_process; 

DELIMITER $$

CREATE TRIGGER trg_after_update_mst_1point1_process 
AFTER UPDATE ON mst_1point1_process 
FOR EACH ROW BEGIN

      DECLARE v_old_values JSON;
      DECLARE v_new_values JSON;
      DECLARE v_changed_columns JSON;
  
      -- Construct old values
      SET v_old_values = JSON_OBJECT(
          'ID', OLD.ID,
          'Name', OLD.Name,
          'ClientId', OLD.ClientId,
          'LocationId', OLD.LocationId,
          'ApprovedFTE', OLD.ApprovedFTE,
          'StandardHrPerFTE', OLD.StandardHrPerFTE,
          'CostPerSheet', OLD.CostPerSheet,
          'WorkingDays', OLD.WorkingDays,
          'WorkingHrPerDays', OLD.WorkingHrPerDays,
          'IsCapping', OLD.IsCapping,
          'CappingTypeId', OLD.CappingTypeId,
          'MinCapping', OLD.MinCapping,
          'MaxCapping', OLD.MaxCapping,
          'Penalty', OLD.Penalty,
          'Reward', OLD.Reward,
          'OJTHours', OLD.OJTHours,
          'Frequency', OLD.Frequency,
          'IsActive', OLD.IsActive,
          'TaxIds', OLD.TaxIds,
          'CreatedBy', OLD.CreatedBy,
          'CreatedOn', OLD.CreatedOn,
          'UpdatedBy', OLD.UpdatedBy,
          'UpdatedOn', OLD.UpdatedOn,
          'Billingfreqid', OLD.Billingfreqid,
          'billingdate', OLD.billingdate,
          'reminderdaysbeforedue', OLD.reminderdaysbeforedue,
          'PaymentCycle', OLD.PaymentCycle,
          'BillingMethodId', OLD.BillingMethodId,
          'Gstin', OLD.Gstin,
          'IsDeleted', OLD.IsDeleted,
 		  'BillDate', OLD.BillDate,
 		  'ProcessOwnerId', OLD.ProcessOwnerId,
          'Process_AKA',OLD.Process_AKA,
          'TypeId',OLD.TypeId,
 		  'DeliveryModelId', OLD.DeliveryModelId,
          'StartDate', OLD.StartDate,
         'EndDate', OLD.EndDate,
         'IsHoldBackApplicable', OLD.IsHoldBackApplicable,
         'HoldbackPercentage', OLD.HoldbackPercentage,
         'BillingStartDate', OLD.BillingStartDate,
         'BillingEndDate', OLD.BillingEndDate,
         'MinFTE', OLD.MinFTE,
         'MaxFTE', OLD.MaxFTE,
         'IsTDSApplicable', OLD.IsTDSApplicable,
         'CRECount', OLD.CRECount,
         'TLCount', OLD.TLCount,
         'TrainerCount', OLD.TrainerCount,
         'AMCount', OLD.AMCount,
         'QACount', OLD.QACount,
         'IsOvertimeAllowed', OLD.IsOvertimeAllowed,
		 'FinanceApproverId',OLD.FinanceApproverId,
		 'IsClientApprovalRequired',OLD.IsClientApprovalRequired,
		 'ServiceTypeId', OLD.ServiceTypeId,
		 'IsPoRequired', OLD.IsPoRequired         
          
      );
  
      -- Construct new values
      SET v_new_values = JSON_OBJECT(
          'ID', NEW.ID,
          'Name', NEW.Name,
          'ClientId', NEW.ClientId,
          'LocationId', NEW.LocationId,
          'ApprovedFTE', NEW.ApprovedFTE,
          'StandardHrPerFTE', NEW.StandardHrPerFTE,
          'CostPerSheet', NEW.CostPerSheet,
          'WorkingDays', NEW.WorkingDays,
          'WorkingHrPerDays', NEW.WorkingHrPerDays,
          'IsCapping', NEW.IsCapping,
          'CappingTypeId', NEW.CappingTypeId,
          'MinCapping', NEW.MinCapping,
          'MaxCapping', NEW.MaxCapping,
          'Penalty', NEW.Penalty,
          'Reward', NEW.Reward,
          'OJTHours', NEW.OJTHours,
          'Frequency', NEW.Frequency,
          'IsActive', NEW.IsActive,
          'TaxIds', NEW.TaxIds,
          'CreatedBy', NEW.CreatedBy,
          'CreatedOn', NEW.CreatedOn,
          'UpdatedBy', NEW.UpdatedBy,
          'UpdatedOn', NEW.UpdatedOn,
          'Billingfreqid', NEW.Billingfreqid,
          'billingdate', NEW.billingdate,
          'reminderdaysbeforedue', NEW.reminderdaysbeforedue,
          'PaymentCycle', NEW.PaymentCycle,
          'BillingMethodId', NEW.BillingMethodId,
          'Gstin', NEW.Gstin,
          'IsDeleted', NEW.IsDeleted,
 		 'BillDate', NEW.BillDate,
 		 'ProcessOwnerId', NEW.ProcessOwnerId,
          'Process_AKA', NEW.Process_AKA,
         'TypeId', NEW.TypeId,
         'DeliveryModelId', NEW.DeliveryModelId,
         'StartDate', NEW.StartDate,
         'EndDate', NEW.EndDate,
         'IsHoldBackApplicable', NEW.IsHoldBackApplicable,
         'HoldbackPercentage', NEW.HoldbackPercentage,
         'BillingStartDate', NEW.BillingStartDate,
         'BillingEndDate', NEW.BillingEndDate,
         'MinFTE', NEW.MinFTE,
         'MaxFTE', NEW.MaxFTE,
         'IsTDSApplicable', NEW.IsTDSApplicable,
         'CRECount', NEW.CRECount,
         'TLCount', NEW.TLCount,
         'TrainerCount', NEW.TrainerCount,
         'AMCount', NEW.AMCount,
         'QACount', NEW.QACount,
         'IsOvertimeAllowed', NEW.IsOvertimeAllowed,
		 'FinanceApproverId',NEW.FinanceApproverId,
		 'IsClientApprovalRequired',NEW.IsClientApprovalRequired,
		'ServiceTypeId', NEW.ServiceTypeId,
		'IsPoRequired', NEW.IsPoRequired
      );
  
      -- Initialize changed columns
      SET v_changed_columns = JSON_ARRAY();
  
    -- Detect changes
    IF NOT (OLD.ID <=> NEW.ID) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'ID');
END IF;

IF NOT (OLD.Name <=> NEW.Name) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'Name');
END IF;

IF NOT (OLD.ClientId <=> NEW.ClientId) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'ClientId');
END IF;

IF NOT (OLD.LocationId <=> NEW.LocationId) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'LocationId');
END IF;

IF NOT (OLD.ApprovedFTE <=> NEW.ApprovedFTE) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'ApprovedFTE');
END IF;

IF NOT (OLD.StandardHrPerFTE <=> NEW.StandardHrPerFTE) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'StandardHrPerFTE');
END IF;

IF NOT (OLD.CostPerSheet <=> NEW.CostPerSheet) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'CostPerSheet');
END IF;

IF NOT (OLD.WorkingDays <=> NEW.WorkingDays) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'WorkingDays');
END IF;

IF NOT (OLD.WorkingHrPerDays <=> NEW.WorkingHrPerDays) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'WorkingHrPerDays');
END IF;

IF NOT (OLD.IsCapping <=> NEW.IsCapping) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'IsCapping');
END IF;

IF NOT (OLD.CappingTypeId <=> NEW.CappingTypeId) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'CappingTypeId');
END IF;

IF NOT (OLD.MinCapping <=> NEW.MinCapping) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'MinCapping');
END IF;

IF NOT (OLD.MaxCapping <=> NEW.MaxCapping) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'MaxCapping');
END IF;

IF NOT (OLD.Penalty <=> NEW.Penalty) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'Penalty');
END IF;

IF NOT (OLD.Reward <=> NEW.Reward) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'Reward');
END IF;

IF NOT (OLD.OJTHours <=> NEW.OJTHours) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'OJTHours');
END IF;

IF NOT (OLD.Frequency <=> NEW.Frequency) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'Frequency');
END IF;

IF NOT (OLD.IsActive <=> NEW.IsActive) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'IsActive');
END IF;

IF NOT (OLD.TaxIds <=> NEW.TaxIds) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'TaxIds');
END IF;

IF NOT (OLD.CreatedBy <=> NEW.CreatedBy) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'CreatedBy');
END IF;

IF NOT (OLD.CreatedOn <=> NEW.CreatedOn) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'CreatedOn');
END IF;

IF NOT (OLD.UpdatedBy <=> NEW.UpdatedBy) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'UpdatedBy');
END IF;

IF NOT (OLD.UpdatedOn <=> NEW.UpdatedOn) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'UpdatedOn');
END IF;

IF NOT (OLD.Billingfreqid <=> NEW.Billingfreqid) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'Billingfreqid');
END IF;

IF NOT (OLD.billingdate <=> NEW.billingdate) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'billingdate');
END IF;

IF NOT (OLD.reminderdaysbeforedue <=> NEW.reminderdaysbeforedue) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'reminderdaysbeforedue');
END IF;

IF NOT (OLD.PaymentCycle <=> NEW.PaymentCycle) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'PaymentCycle');
END IF;

IF NOT (OLD.BillingMethodId <=> NEW.BillingMethodId) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'BillingMethodId');
END IF;

IF NOT (OLD.Gstin <=> NEW.Gstin) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'Gstin');
END IF;

IF NOT (OLD.IsDeleted <=> NEW.IsDeleted) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'IsDeleted');
END IF;

IF NOT (OLD.BillDate <=> NEW.BillDate) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'BillDate');
END IF;

IF NOT (OLD.ProcessOwnerId <=> NEW.ProcessOwnerId) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'ProcessOwnerId');
END IF;

IF NOT (OLD.Process_AKA <=> NEW.Process_AKA) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'Process_AKA');
END IF;

IF NOT (OLD.TypeId <=> NEW.TypeId) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'TypeId');
END IF;

IF NOT (OLD.DeliveryModelId <=> NEW.DeliveryModelId) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'DeliveryModelId');
END IF;

IF NOT (OLD.StartDate <=> NEW.StartDate) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'StartDate');
END IF;

IF NOT (OLD.EndDate <=> NEW.EndDate) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'EndDate');
END IF;

IF NOT (OLD.IsHoldBackApplicable <=> NEW.IsHoldBackApplicable) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'IsHoldBackApplicable');
END IF;

IF NOT (OLD.HoldbackPercentage <=> NEW.HoldbackPercentage) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'HoldbackPercentage');
END IF;

IF NOT (OLD.BillingStartDate <=> NEW.BillingStartDate) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'BillingStartDate');
END IF;

IF NOT (OLD.BillingEndDate <=> NEW.BillingEndDate) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'BillingEndDate');
END IF;

IF NOT (OLD.MinFTE <=> NEW.MinFTE) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'MinFTE');
END IF;

IF NOT (OLD.MaxFTE <=> NEW.MaxFTE) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'MaxFTE');
END IF;

IF NOT (OLD.IsTDSApplicable <=> NEW.IsTDSApplicable) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'IsTDSApplicable');
END IF;

IF NOT (OLD.CRECount <=> NEW.CRECount) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'CRECount');
END IF;

IF NOT (OLD.TLCount <=> NEW.TLCount) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'TLCount');
END IF;

IF NOT (OLD.TrainerCount <=> NEW.TrainerCount) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'TrainerCount');
END IF;

IF NOT (OLD.AMCount <=> NEW.AMCount) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'AMCount');
END IF;

IF NOT (OLD.QACount <=> NEW.QACount) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'QACount');
END IF;

IF NOT (OLD.IsOvertimeAllowed <=> NEW.IsOvertimeAllowed) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'IsOvertimeAllowed');
END IF;

IF NOT (OLD.FinanceApproverId <=> NEW.FinanceApproverId) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'FinanceApproverId');
END IF;

IF NOT (OLD.IsClientApprovalRequired <=> NEW.IsClientApprovalRequired) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'IsClientApprovalRequired');
END IF;

IF NOT (OLD.ServiceTypeId <=> NEW.ServiceTypeId) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'ServiceTypeId');
END IF;

IF NOT (OLD.IsPoRequired <=> NEW.IsPoRequired) THEN
    SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'IsPoRequired');
END IF;
  
      -- Only log if something actually changed
      IF JSON_LENGTH(v_changed_columns) > 0 THEN
          INSERT INTO trn_1point1_process_log   -- ✅ FIXED HERE
          (
              table_name,
              primary_key_column,
              primary_key_value,
              old_values,
              new_values,
              changed_columns,
              operation_type,
              changed_by,
              changed_on
          )
          VALUES
          (
              'mst_1point1_process',
              'ID',
              NEW.ID,
              v_old_values,
              v_new_values,
              v_changed_columns,
              'UPDATE',
              NEW.UpdatedBy,
              NOW()
          );
      END IF;
  
 END$$

DELIMITER ;