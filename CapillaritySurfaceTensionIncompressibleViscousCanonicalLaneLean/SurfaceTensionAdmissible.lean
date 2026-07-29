import HautevilleHouse.CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.CapillarityInterface

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure SurfaceTensionPackage {C : CapillarityAdmittedObject} where
  youngLaplaceEquation : Prop
  curvatureJumpCondition : Prop
  stressBoundaryCondition : Prop
  surfaceTensionConstant : Prop

structure SurfaceTensionEvidence {C : CapillarityAdmittedObject} (S : SurfaceTensionPackage C) where
  youngLaplaceEquationClosed : S.youngLaplaceEquation
  curvatureJumpConditionClosed : S.curvatureJumpCondition
  stressBoundaryConditionClosed : S.stressBoundaryCondition
  surfaceTensionConstantClosed : S.surfaceTensionConstant

def SurfaceTensionClosed {C : CapillarityAdmittedObject} (S : SurfaceTensionPackage C) : Prop :=
  S.youngLaplaceEquation ∧ S.curvatureJumpCondition ∧ S.stressBoundaryCondition ∧ S.surfaceTensionConstant

theorem surface_tension_closed_from_evidence {C : CapillarityAdmittedObject} (S : SurfaceTensionPackage C) (E : SurfaceTensionEvidence S) : SurfaceTensionClosed S := by
  exact And.intro E.youngLaplaceEquationClosed (And.intro E.curvatureJumpConditionClosed (And.intro E.stressBoundaryConditionClosed E.surfaceTensionConstantClosed))

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse