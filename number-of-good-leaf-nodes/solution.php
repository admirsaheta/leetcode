<?php
class Solution {
    private $goodPairs;
    private $distance;

/**
 * @param TreeNode $root
 * @param int $distance
 * @return int
 */
function countPairs($root, $distance) {
    $this->goodPairs = 0;
    $this->distance = $distance;
    $this->dfs($root);
    return $this->goodPairs;
}

private function dfs($node) {
    if ($node === null) {
        return [];
    }
    
    if ($node->left === null && $node->right === null) {
        return [1];
    }
    
    $leftDistances = $this->dfs($node->left);
    $rightDistances = $this->dfs($node->right);
    
    foreach ($leftDistances as $ld) {
        foreach ($rightDistances as $rd) {
            if ($ld + $rd <= $this->distance) {
                $this->goodPairs++;
            }
        }
    }
    
    $currentDistances = [];
    foreach ($leftDistances as $ld) {
        if ($ld + 1 <= $this->distance) {
            $currentDistances[] = $ld + 1;
        }
    }
    foreach ($rightDistances as $rd) {
        if ($rd + 1 <= $this->distance) {
            $currentDistances[] = $rd + 1;
        }
    }
    
    return $currentDistances;
}
}