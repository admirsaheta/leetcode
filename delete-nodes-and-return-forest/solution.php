<?php

/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     public $val = null;
 *     public $left = null;
 *     public $right = null;
 *     function __construct($val = 0, $left = null, $right = null) {
 *         $this->val = $val;
 *         $this->left = $left;
 *         $this->right = $right;
 *     }
 * }
 */
class Solution {
    /**
     * @param TreeNode $root
     * @param Integer[] $to_delete
     * @return TreeNode[]
     */
    function delNodes($root, $to_delete) {
        $to_delete_set = array_flip($to_delete);
        $remaining_roots = [];
        
        $this->dfs($root, true, $to_delete_set, $remaining_roots);
        return $remaining_roots;
    }
    
    private function dfs($node, $is_root, &$to_delete_set, &$remaining_roots) {
        if ($node == null) {
            return null;
        }
        $deleted = isset($to_delete_set[$node->val]);
        if ($is_root && !$deleted) {
            $remaining_roots[] = $node;
        }
        $node->left = $this->dfs($node->left, $deleted, $to_delete_set, $remaining_roots);
        $node->right = $this->dfs($node->right, $deleted, $to_delete_set, $remaining_roots);
        return $deleted ? null : $node;
    }
}
