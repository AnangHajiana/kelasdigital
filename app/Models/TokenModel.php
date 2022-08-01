<?php

namespace App\Models;

use CodeIgniter\Model;

class TokenModel extends Model
{
    protected $table      = 't_token';
    protected $primaryKey = 'uuid';

    protected $useAutoIncrement = true;

    protected $returnType     = 'array';
    protected $useSoftDeletes = false;
	
    protected $allowedFields = ['user_name','token', 'uuid', 'expired'];

    protected $useTimestamps = false;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;
}