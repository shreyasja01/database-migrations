DROP TRIGGER IF EXISTS trg_after_update_mst_1point1_process_checker;

CREATE TRIGGER trg_after_update_mst_1point1_process_checker
AFTER UPDATE ON mst_1point1_process_checker
FOR EACH ROW
BEGIN
    DECLARE v_old_values JSON;
    DECLARE v_new_values JSON;
    DECLARE v_changed_columns JSON;

    SET v_old_values = JSON_OBJECT(
        'Id', OLD.Id,
        'ProcessId', OLD.ProcessId,
        'ApprovalTypeId', OLD.ApprovalTypeId,
        'EmployeeId', OLD.EmployeeId,
        'Sequence', OLD.Sequence,
        'IsFinalApprover', OLD.IsFinalApprover,
        'IsActive', OLD.IsActive,
        'IsArchived', OLD.IsArchived,
        'CreatedBy', OLD.CreatedBy,
        'CreatedOn', OLD.CreatedOn,
        'UpdatedBy', OLD.UpdatedBy,
        'UpdatedOn', OLD.UpdatedOn
    );

    SET v_new_values = JSON_OBJECT(
        'Id', NEW.Id,
        'ProcessId', NEW.ProcessId,
        'ApprovalTypeId', NEW.ApprovalTypeId,
        'EmployeeId', NEW.EmployeeId,
        'Sequence', NEW.Sequence,
        'IsFinalApprover', NEW.IsFinalApprover,
        'IsActive', NEW.IsActive,
        'IsArchived', NEW.IsArchived,
        'CreatedBy', NEW.CreatedBy,
        'CreatedOn', NEW.CreatedOn,
        'UpdatedBy', NEW.UpdatedBy,
        'UpdatedOn', NEW.UpdatedOn
    );

    SET v_changed_columns = JSON_ARRAY();

    IF NOT (OLD.ProcessId <=> NEW.ProcessId) THEN
        SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'ProcessId');
    END IF;
    IF NOT (OLD.ApprovalTypeId <=> NEW.ApprovalTypeId) THEN
        SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'ApprovalTypeId');
    END IF;
    IF NOT (OLD.EmployeeId <=> NEW.EmployeeId) THEN
        SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'EmployeeId');
    END IF;
    IF NOT (OLD.Sequence <=> NEW.Sequence) THEN
        SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'Sequence');
    END IF;
    IF NOT (OLD.IsFinalApprover <=> NEW.IsFinalApprover) THEN
        SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'IsFinalApprover');
    END IF;
    IF NOT (OLD.IsActive <=> NEW.IsActive) THEN
        SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'IsActive');
    END IF;
    IF NOT (OLD.IsArchived <=> NEW.IsArchived) THEN
        SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'IsArchived');
    END IF;
    IF NOT (OLD.UpdatedBy <=> NEW.UpdatedBy) THEN
        SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'UpdatedBy');
    END IF;
    IF NOT (OLD.UpdatedOn <=> NEW.UpdatedOn) THEN
        SET v_changed_columns = JSON_ARRAY_APPEND(v_changed_columns, '$', 'UpdatedOn');
    END IF;

    IF JSON_LENGTH(v_changed_columns) > 0 THEN
        INSERT INTO trn_1point1_process_log (
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
        VALUES (
            'mst_1point1_process_checker',
            'Id',
            NEW.Id,
            v_old_values,
            v_new_values,
            v_changed_columns,
            'UPDATE',
            NEW.UpdatedBy,
            NOW()
        );
    END IF;
END;